# WordPress Website Generator

This WordPress Website Generator is a simple tool to help you set up a WordPress site quickly using a configuration form. It consists of an HTML form to gather configuration details and a bash script to automate the process of setting up a WordPress site using the [WP-CLI](https://wp-cli.org/).

## Prerequisites

Before using this WordPress Website Generator, ensure that the following prerequisites are met:

1. You have a system running Linux or macOS.
2. You have installed WP-CLI on your system. Follow the installation instructions [here](https://wp-cli.org/#installing).
3. You have a MySQL server installed and running.

## How to Use

To use the WordPress Website Generator, follow these steps:

1. Download the `config_form.html` file and the `setup_wordpress.sh` bash script.

2. Open the `config_form.html` file in your web browser. You will see a dark-themed form with various fields to configure your WordPress site.

3. Fill in the form with your desired configuration:

   - Database Name
   - Database User
   - Database Password
   - Database Host
   - WordPress URL
   - WordPress Title
   - WordPress Admin User
   - WordPress Admin Password
   - WordPress Admin Email
   - Custom Theme (slug or ZIP URL)
   - Plugins (slugs or ZIP URLs separated by spaces)

4. Click the "Generate .env file" button at the bottom of the form. This will download a `.env` file containing the configuration you just entered.

5. Move the downloaded `.env` file to the same directory as the `setup_wordpress.sh` script.

6. Open a terminal and navigate to the directory containing the `setup_wordpress.sh` script and the `.env` file.

7. Make the script executable by running the following command:

   ```bash
   chmod +x setup_wordpress.sh
   ```

8. Execute the script by running:

   ```bash
   ./setup_wordpress.sh
   ```

The script will now set up your WordPress site with the configuration you provided, including the custom theme and plugins. When the process is complete, you will see the message "WordPress site is now up and running!"

You can now visit your WordPress site in a web browser using the URL you provided during the configuration step.

## Troubleshooting

If you encounter any issues while using the WordPress Website Generator, first ensure that you have met all prerequisites mentioned above. If issues persist, refer to the [WP-CLI documentation](https://wp-cli.org/docs/) for more information on the commands used in the `setup_wordpress.sh` script.