Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CDAED3515CA
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 16:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617289190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=08s3AhKqkTzb9phtUIzaK7tlst8kK0kmWebG+afa8z4=;
	b=G4+z8pzVh5pLDryg5+J5Y+w+mw76lBElBe6AXlWHSCxoXd1b+3ip1HbLPaMC1DZOQU4XD1
	kVr7x167wtNqoIZ7wnTnbVpMqlyUK8Z3mM8xM7hsuRkG3q0j0pk2Uzs2gAoq3u3OkFvXMc
	0BxlawTxSRBTc6eglOOPm9kMqxOvCBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-DPzIP7SxM4ut5whfEFKDeA-1; Thu, 01 Apr 2021 10:59:49 -0400
X-MC-Unique: DPzIP7SxM4ut5whfEFKDeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53F9E801FCE;
	Thu,  1 Apr 2021 14:59:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B64C919D7D;
	Thu,  1 Apr 2021 14:59:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AE7E1809C83;
	Thu,  1 Apr 2021 14:59:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131Exbx0032323 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 10:59:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D64162461; Thu,  1 Apr 2021 14:59:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-77.rdu2.redhat.com [10.10.114.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B99EC61F47;
	Thu,  1 Apr 2021 14:59:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  1 Apr 2021 10:59:28 -0400
Message-Id: <20210401145928.9256-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool] libdlm: introduce timeout opt
	parameter
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a dlm_opts struct which can be extended in future to
apply additional parameters to dlm functionality. This patch will add a
timeout parameter inside dlm opts for several dlm function to set the
amount of polling tries to wait for the dlm control device node. In some
cases of a large amount of creation of lockspaces in a short time it
seems to be necessary to increase this value on some systems. Users of
libdlm can update to this new API in due courses to handle a variable
or user defined timeout value.

Reported-by: Bob Peterson <rpeterso@redhat.com>
---
I saved the timeout value per ls for the release functionality, but I
am not sure if this makes sense because why we wait for a device on release?
It should already be there?

 libdlm/libdlm.c | 75 ++++++++++++++++++++++++++++++++++++++++---------
 libdlm/libdlm.h | 21 +++++++++++++-
 2 files changed, 81 insertions(+), 15 deletions(-)

diff --git a/libdlm/libdlm.c b/libdlm/libdlm.c
index ebfba457..97c7387c 100644
--- a/libdlm/libdlm.c
+++ b/libdlm/libdlm.c
@@ -40,6 +40,7 @@
 #define DLM_CONTROL_NAME	"dlm-control"
 #define DLM_CONTROL_PATH	MISC_PREFIX DLM_CONTROL_NAME
 #define DEFAULT_LOCKSPACE	"default"
+#define DEFAULT_DEVICE_TIMEOUT	10
 
 /*
  * V5 of the dlm_device.h kernel/user interface structs
@@ -96,6 +97,7 @@ struct dlm_ls_info {
 #else
     int tid;
 #endif
+    struct dlm_opts opts;
 };
 
 /*
@@ -110,6 +112,9 @@ static int control_fd = -1;
 static struct dlm_device_version kernel_version;
 static int kernel_version_detected = 0;
 
+static const struct dlm_opts dlm_default_opts = {
+	.ctrl_dev_timeout = DEFAULT_DEVICE_TIMEOUT,
+};
 
 static int release_lockspace(uint32_t minor, uint32_t flags);
 
@@ -367,7 +372,7 @@ static int find_control_minor(int *minor)
 	return -1;
 }
 
-static int open_control_device(void)
+static int open_control_device(unsigned int timeout)
 {
 	struct stat st;
 	int i, rv, minor, found = 0;
@@ -381,7 +386,7 @@ static int open_control_device(void)
 
 	/* wait for udev to create the device */
 
-	for (i = 0; i < 10; i++) {
+	for (i = 0; i < timeout; i++) {
 		if (stat(DLM_CONTROL_PATH, &st) == 0 &&
 		    minor(st.st_rdev) == minor) {
 			found = 1;
@@ -409,7 +414,8 @@ static int open_control_device(void)
 /* the max number of characters in a sysfs device name, not including \0 */
 #define MAX_SYSFS_NAME 19
 
-static int find_udev_device(const char *lockspace, int minor, char *udev_path)
+static int find_udev_device(const char *lockspace, int minor, char *udev_path,
+			    unsigned int timeout)
 {
 	char bname[PATH_MAX];
 	char tmp_path[PATH_MAX];
@@ -423,7 +429,7 @@ static int find_udev_device(const char *lockspace, int minor, char *udev_path)
 	snprintf(bname, PATH_MAX, DLM_PREFIX "%s", lockspace);
 	basename_len = strlen(bname);
 
-	for (i = 0; i < 10; i++) {
+	for (i = 0; i < timeout; i++) {
 
 		/* look for a device with the full name */
 
@@ -1285,7 +1291,8 @@ static int create_lockspace_v6(const char *name, uint32_t flags)
 }
 
 static dlm_lshandle_t create_lockspace(const char *name, mode_t mode,
-				       uint32_t flags)
+				       uint32_t flags,
+				       const struct dlm_opts *opts)
 {
 	char dev_path[PATH_MAX];
 	char udev_path[PATH_MAX];
@@ -1293,7 +1300,7 @@ static dlm_lshandle_t create_lockspace(const char *name, mode_t mode,
 	int error, saved_errno, minor;
 
 	/* We use the control device for creating lockspaces. */
-	if (open_control_device())
+	if (open_control_device(opts->ctrl_dev_timeout))
 		return NULL;
 
 	newls = malloc(sizeof(struct dlm_ls_info));
@@ -1301,6 +1308,7 @@ static dlm_lshandle_t create_lockspace(const char *name, mode_t mode,
 		return NULL;
 
 	ls_dev_name(name, dev_path, sizeof(dev_path));
+	newls->opts = *opts;
 
 	if (kernel_version.version[0] == 5)
 		minor = create_lockspace_v5(name, flags);
@@ -1313,7 +1321,8 @@ static dlm_lshandle_t create_lockspace(const char *name, mode_t mode,
 	/* Wait for udev to create the device; the device it creates may
 	   have a truncated name due to the sysfs device name limit. */
 	   
-	error = find_udev_device(name, minor, udev_path);
+	error = find_udev_device(name, minor, udev_path,
+				 opts->ctrl_dev_timeout);
 	if (error)
 		goto fail;
 
@@ -1346,12 +1355,25 @@ static dlm_lshandle_t create_lockspace(const char *name, mode_t mode,
 
 dlm_lshandle_t dlm_new_lockspace(const char *name, mode_t mode, uint32_t flags)
 {
-	return create_lockspace(name, mode, flags);
+	return create_lockspace(name, mode, flags, &dlm_default_opts);
+}
+
+dlm_lshandle_t dlm_new_lockspace_opts(const char *name, mode_t mode,
+				      uint32_t flags,
+				      const struct dlm_opts *opts)
+{
+	return create_lockspace(name, mode, flags, opts);
 }
 
 dlm_lshandle_t dlm_create_lockspace(const char *name, mode_t mode)
 {
-	return create_lockspace(name, mode, 0);
+	return create_lockspace(name, mode, 0, &dlm_default_opts);
+}
+
+dlm_lshandle_t dlm_create_lockspace_opts(const char *name, mode_t mode,
+					 const struct dlm_opts *opts)
+{
+	return create_lockspace(name, mode, 0, opts);
 }
 
 static int release_lockspace_v5(uint32_t minor, uint32_t flags)
@@ -1405,7 +1427,7 @@ int dlm_release_lockspace(const char *name, dlm_lshandle_t ls, int force)
 	/* Close the lockspace first if it's in use */
 	ls_pthread_cleanup(lsinfo);
 
-	if (open_control_device())
+	if (open_control_device(lsinfo->opts.ctrl_dev_timeout))
 		return -1;
 
 	if (force)
@@ -1439,14 +1461,15 @@ int dlm_release_lockspace(const char *name, dlm_lshandle_t ls, int force)
  * Normal users just open/close lockspaces
  */
 
-dlm_lshandle_t dlm_open_lockspace(const char *name)
+static dlm_lshandle_t _dlm_open_lockspace(const char *name,
+					  const struct dlm_opts *opts)
 {
 	char dev_name[PATH_MAX];
 	struct dlm_ls_info *newls;
 	int saved_errno;
 
 	/* Need to detect kernel version */
-	if (open_control_device())
+	if (open_control_device(opts->ctrl_dev_timeout))
 		return NULL;
 
 	newls = malloc(sizeof(struct dlm_ls_info));
@@ -1455,6 +1478,7 @@ dlm_lshandle_t dlm_open_lockspace(const char *name)
 
 	newls->tid = 0;
 	ls_dev_name(name, dev_name, sizeof(dev_name));
+	newls->opts = *opts;
 
 	newls->fd = open(dev_name, O_RDWR);
 	saved_errno = errno;
@@ -1468,6 +1492,17 @@ dlm_lshandle_t dlm_open_lockspace(const char *name)
 	return (dlm_lshandle_t)newls;
 }
 
+dlm_lshandle_t dlm_open_lockspace(const char *name)
+{
+	return _dlm_open_lockspace(name, &dlm_default_opts);
+}
+
+dlm_lshandle_t dlm_open_lockspace_opts(const char *name,
+				       const struct dlm_opts *opts)
+{
+	return _dlm_open_lockspace(name, opts);
+}
+
 int dlm_close_lockspace(dlm_lshandle_t ls)
 {
 	struct dlm_ls_info *lsinfo = (struct dlm_ls_info *)ls;
@@ -1476,9 +1511,10 @@ int dlm_close_lockspace(dlm_lshandle_t ls)
 	return 0;
 }
 
-int dlm_kernel_version(uint32_t *major, uint32_t *minor, uint32_t *patch)
+static int _dlm_kernel_version(uint32_t *major, uint32_t *minor, uint32_t *patch,
+			       const struct dlm_opts *opts)
 {
-	if (open_control_device())
+	if (open_control_device(opts->ctrl_dev_timeout))
 		return -1;
 	*major = kernel_version.version[0];
 	*minor = kernel_version.version[1];
@@ -1486,6 +1522,17 @@ int dlm_kernel_version(uint32_t *major, uint32_t *minor, uint32_t *patch)
 	return 0;
 }
 
+int dlm_kernel_version(uint32_t *major, uint32_t *minor, uint32_t *patch)
+{
+	return _dlm_kernel_version(major, minor, patch, &dlm_default_opts);
+}
+
+int dlm_kernel_version_opts(uint32_t *major, uint32_t *minor, uint32_t *patch,
+			    const struct dlm_opts *opts)
+{
+	return _dlm_kernel_version(major, minor, patch, opts);
+}
+
 void dlm_library_version(uint32_t *major, uint32_t *minor, uint32_t *patch)
 {
 	*major = DLM_DEVICE_VERSION_MAJOR;
diff --git a/libdlm/libdlm.h b/libdlm/libdlm.h
index 9255181c..156aa16e 100644
--- a/libdlm/libdlm.h
+++ b/libdlm/libdlm.h
@@ -56,7 +56,20 @@ struct dlm_lksb {
 struct dlm_queryinfo;
 #endif
 
+/*
+ * dlm opts structure - pass options to dlm functions
+ *
+ * ctrl_dev_timeout - define the amount of polling tries until timeout for a
+ *                    dlm control device. Each polling try results in an one
+ *                    second sleep.
+ */
+struct dlm_opts {
+	unsigned int ctrl_dev_timeout;
+};
+
 extern int dlm_kernel_version(uint32_t *maj, uint32_t *min, uint32_t *patch);
+extern int dlm_kernel_version_opts(uint32_t *major, uint32_t *minor, uint32_t *patch,
+				   const struct dlm_opts *opts);
 extern void dlm_library_version(uint32_t *maj, uint32_t *min, uint32_t *patch);
 
 
@@ -117,7 +130,6 @@ extern int dlm_unlock_wait(uint32_t lkid,
 extern int dlm_get_fd(void);
 extern int dlm_dispatch(int fd);
 
-
 /*
  * Creating your own lockspace
  *
@@ -138,13 +150,20 @@ extern int dlm_dispatch(int fd);
 typedef void *dlm_lshandle_t;
 
 extern dlm_lshandle_t dlm_create_lockspace(const char *name, mode_t mode);
+extern dlm_lshandle_t dlm_create_lockspace_opts(const char *name, mode_t mode,
+						const struct dlm_opts *opts);
 extern int dlm_release_lockspace(const char *name, dlm_lshandle_t ls,
 		int force);
 extern dlm_lshandle_t dlm_open_lockspace(const char *name);
+extern dlm_lshandle_t dlm_open_lockspace_opts(const char *name,
+					      const struct dlm_opts *opts);
 extern int dlm_close_lockspace(dlm_lshandle_t ls);
 extern int dlm_ls_get_fd(dlm_lshandle_t ls);
 extern dlm_lshandle_t dlm_new_lockspace(const char *name, mode_t mode,
 		uint32_t flags);
+extern dlm_lshandle_t dlm_new_lockspace_opts(const char *name, mode_t mode,
+					     uint32_t flags,
+					     const struct dlm_opts *opts);
 
 
 /*
-- 
2.26.3

