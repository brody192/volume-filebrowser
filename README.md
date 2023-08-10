![](https://i.imgur.com/go7aJHL.png)

# Volume Filebrowser

The Volume File Browser for Railway is a tool designed to access the files stored in a volume. This utility provides a simple and efficient way to retrieve files from the designated volume.

## This utility offers a single feature:

1. **File Retrieval**: Download files stored in the attached volume.

## How to use

Follow these steps to deploy this template service:

### **Note**: This template must be deployed into a pre-existing project, it wouldn't be much use deploying it as its own project.

1. **Open the Project**: Start by opening the project that contains the desired service with the volume you want to download data from.

2. **Add Volume File Browser**: Click the `+ New` button and search for `Volume File Browser`.

3. **Note the Current Mount Path**: Right-click on the volume you want to access, then choose `View Settings`. Take note of the current mount path, as you will need it later.

4. **Remove the active deployment**: The active deployment must be removed, otherwise it may try to write to a non-existent volume. Open the service and click on the 3-dot menu on the active deployment, choose Remove, and Remove once again on the prompt.

4. **Disconnect the Volume**: Right-click on the volume attached to your service and select `Disconnect`.

5. **Mount the Volume to Volume File Browser**: Click on the newly disconnected volume, then click `Mount` and select `Volume File Browser` as the destination, and use `/data` as the mount point. Wait for the redeployment process to complete.

6. **Retrieve Basic Auth Credentials**: The basic authentication credentials will be logged in the deploy logs.

    ![](https://i.imgur.com/bMu5su6.png)

8. **Access the Utility**: Click on the Railway-provided domain to access the File Access Utility, and login with the auto-generated credentials.

9. **Download Files**: Once logged in, you can now download your desired file(s) from the volume.

10. **Disconnect the Volume**: After downloading the file(s), disconnect the volume from the File Browser service.

11. **Remount to Original Service**: Finally, mount the volume back to the original service using the original mount path noted earlier.

12. **Redeploy the Service**: Allow the service to redeploy, ensuring that the volume is correctly attached.
