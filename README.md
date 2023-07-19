# Railway Platform File Access Utility

The Railway Platform File Access Utility is a tool designed to access the files stored in a volume on the railway platform. This utility provides a simple and efficient way to retrieve files from the designated volume.

## This utility offers a single feature:

1. **File Retrieval**: Download files stored in the attached volume.

## How to use

Follow these steps to deploy and configure the Railway Platform File Access Utility:

1. **Open the Project**: Start by opening the project that contains the desired service with the volume you want to download data from.

2. **Add Volume File Browser**: Click the `+ New` button and search for `Volume File Browser`. Although the deployment may crash, it's expected for now.

3. **Note the Current Mount Path**: Right-click on the volume you want to access, then choose `View Settings`. Take note of the current mount path, as you will need it later.

4. **Disconnect the Volume**: Right-click on the volume attached to your service and select `Disconnect`.

5. **Mount the Volume to Volume File Browser**: Click on the newly disconnected volume, then click `Mount` and select `Volume File Browser` as the destination, and use `/data` as the mount point. Wait for the redeployment process to complete.

6. **Retrieve Basic Auth Credentials**: The basic authentication credentials will be logged in the deploy logs. Note down these credentials for login purposes.

7. **Access the Utility**: Click on the Railway-provided domain to access the File Access Utility.

8. **Download Files**: Once logged in, you can now download your desired files from the volume.

9. **Disconnect the Volume**: After downloading the files, disconnect the volume from the File Browser service.

10. **Remount to Original Service**: Finally, mount the volume back to the original service using the original mount path noted earlier.

11. **Redeploy the Service**: Allow the service to redeploy, ensuring that the volume is correctly attached.
