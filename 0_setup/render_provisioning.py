#!/usr/bin/env python3
"""
Render provisioning / de-provisioning SQL for the Openflow multi-tenant demo
lab from users.yml + templates/*.sql.j2.

Usage:
    python3 render_provisioning.py                 # renders both provision + deprovision
    python3 render_provisioning.py --only provision
    python3 render_provisioning.py --only deprovision
    python3 render_provisioning.py --users other_users.yml

Output goes to rendered/provision_users.sql and rendered/deprovision_users.sql.
Review the rendered SQL before executing it against Snowflake.
"""
import argparse
import pathlib

import yaml
from jinja2 import Environment, FileSystemLoader, StrictUndefined

ROOT = pathlib.Path(__file__).resolve().parent
TEMPLATES_DIR = ROOT / "templates"
RENDERED_DIR = ROOT / "rendered"


def load_context(users_file: pathlib.Path) -> dict:
    with open(users_file) as f:
        data = yaml.safe_load(f)

    required_keys = {"attendee_role", "warehouse", "users"}
    missing = required_keys - data.keys()
    if missing:
        raise ValueError(f"{users_file} is missing required keys: {sorted(missing)}")

    for user in data["users"]:
        if "id" not in user or "password" not in user:
            raise ValueError(f"Each user entry needs 'id' and 'password': {user}")

    return data


def render(template_name: str, context: dict, output_name: str) -> pathlib.Path:
    env = Environment(
        loader=FileSystemLoader(str(TEMPLATES_DIR)),
        undefined=StrictUndefined,
        trim_blocks=True,
        lstrip_blocks=True,
    )
    template = env.get_template(template_name)
    rendered_sql = template.render(**context)

    RENDERED_DIR.mkdir(exist_ok=True)
    output_path = RENDERED_DIR / output_name
    output_path.write_text(rendered_sql)
    return output_path


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--users",
        default="users.yml",
        help="Path to the user list YAML file (default: users.yml)",
    )
    parser.add_argument(
        "--only",
        choices=["provision", "deprovision"],
        help="Render only one side (default: both)",
    )
    args = parser.parse_args()

    users_file = ROOT / args.users
    context = load_context(users_file)
    print(f"Loaded {len(context['users'])} user(s) from {users_file}")

    targets = []
    if args.only in (None, "provision"):
        targets.append(("provision_users.sql.j2", "provision_users.sql"))
    if args.only in (None, "deprovision"):
        targets.append(("deprovision_users.sql.j2", "deprovision_users.sql"))

    for template_name, output_name in targets:
        output_path = render(template_name, context, output_name)
        print(f"Rendered {template_name} -> {output_path}")


if __name__ == "__main__":
    main()
