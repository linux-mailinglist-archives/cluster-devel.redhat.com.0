Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3D35E20B61C
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 18:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593189935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y9xu4jTs22mRYpna6r45h8Ms/I+JKFfPOGd9YwGmvzk=;
	b=SdiYN7IyKi3YsLG4gxaZTjFNH2qe9WiPMSV+EXEgGM6+lcO4oCes9NQ3i+dNtE8SWwy9Fe
	EdfvYe7rpbUHiE0RQI6JxtfP7Ygrajo1OSIGAwVfH/5PGZk8fEtkk1CgxQ3gGSgZ4yf4WK
	zEamaxvlK6A49UsVq01BLG5eGV3jjow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-y5fvJCzlNeyOQt_R9DeDTA-1; Fri, 26 Jun 2020 12:45:33 -0400
X-MC-Unique: y5fvJCzlNeyOQt_R9DeDTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7624107ACF5;
	Fri, 26 Jun 2020 16:45:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B895C5C296;
	Fri, 26 Jun 2020 16:45:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A35A81809543;
	Fri, 26 Jun 2020 16:45:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QGjT6r014849 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 12:45:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D52D9619AC; Fri, 26 Jun 2020 16:45:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA1AC61992;
	Fri, 26 Jun 2020 16:45:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Jun 2020 12:44:45 -0400
Message-Id: <20200626164446.114220-4-aahringo@redhat.com>
In-Reply-To: <20200626164446.114220-1-aahringo@redhat.com>
References: <20200626164446.114220-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-tool 3/4] dlm_controld: add support
	for per nodeid configuration
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds support to make a configuration per nodeid and key-value
pairs. As example this patch will introduce the key mark to set via configfs
comms per nodeid the SO_MARK socket option.
---
 dlm_controld/Makefile      |  3 +-
 dlm_controld/action.c      | 31 ++++++++++++--
 dlm_controld/dlm.conf.5    | 19 +++++++++
 dlm_controld/dlm_daemon.h  |  5 ++-
 dlm_controld/main.c        |  4 ++
 dlm_controld/member.c      |  6 ++-
 dlm_controld/node_config.c | 82 ++++++++++++++++++++++++++++++++++++++
 dlm_controld/node_config.h | 31 ++++++++++++++
 8 files changed, 175 insertions(+), 6 deletions(-)
 create mode 100644 dlm_controld/node_config.c
 create mode 100644 dlm_controld/node_config.h

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index 6081cf8b..fbc8926c 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -32,7 +32,8 @@ BIN_SOURCE = action.c \
              config.c \
              member.c \
              logging.c \
-             rbtree.c
+             rbtree.c \
+             node_config.c
 LIB_SOURCE = lib.c
 
 CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index e901d555..126e3b62 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -570,15 +570,16 @@ static int add_configfs_base(void)
 	return rv;
 }
 
-int add_configfs_node(int nodeid, char *addr, int addrlen, int local)
+int add_configfs_node(int nodeid, char *addr, int addrlen, int local,
+		      uint32_t mark)
 {
 	char path[PATH_MAX];
 	char padded_addr[sizeof(struct sockaddr_storage)];
 	char buf[32];
 	int rv, fd;
 
-	log_debug("set_configfs_node %d %s local %d",
-		  nodeid, str_ip(addr), local);
+	log_debug("set_configfs_node %d %s local %d mark %" PRIu32,
+		  nodeid, str_ip(addr), local, mark);
 
 	/*
 	 * create comm dir for this node
@@ -639,6 +640,30 @@ int add_configfs_node(int nodeid, char *addr, int addrlen, int local)
 	}
 	close(fd);
 
+	/*
+	 * set skb mark for nodeid
+	 */
+
+	memset(path, 0, PATH_MAX);
+	snprintf(path, PATH_MAX, "%s/%d/mark", COMMS_DIR, nodeid);
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0) {
+		log_error("%s: open failed: %d", path, errno);
+		return -1;
+	}
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, 32, "%" PRIu32, mark);
+
+	rv = do_write(fd, buf, strlen(buf));
+	if (rv < 0) {
+		log_error("%s: write failed: %d, %s", path, errno, buf);
+		close(fd);
+		return -1;
+	}
+	close(fd);
+
 	/*
 	 * set local
 	 */
diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 771951d4..1ce0c644 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -392,6 +392,25 @@ master    foo node=2 weight=1
 In which case node 1 will master 2/3 of the total resources and node 2
 will master the other 1/3.
 
+.SS Node configuration
+
+Node configurations can be set by the node keyword followed of key-value
+pairs.
+
+.B Keys:
+
+.B mark
+The mark key can be used to set a specific mark value which is then used
+by the in-kernel DLM socket creation. This can be used to match for DLM
+specfic packets for e.g. routing.
+
+Example of setting a per socket value for nodeid 1 and a mark value
+of 42:
+
+node id=1 mark=42
+
+For local nodes this value doesn't have any effect.
+
 .SH SEE ALSO
 .BR dlm_controld (8),
 .BR dlm_tool (8)
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 8816ca75..9e7a5fbf 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -40,6 +40,7 @@
 #include <sched.h>
 #include <signal.h>
 #include <dirent.h>
+#include <inttypes.h>
 #include <sys/sysmacros.h>
 
 #include <corosync/cpg.h>
@@ -48,6 +49,7 @@
 #include "libdlmcontrol.h"
 #include "dlm_controld.h"
 #include "fence_config.h"
+#include "node_config.h"
 #include "list.h"
 #include "rbtree.h"
 #include "linux_endian.h"
@@ -364,7 +366,8 @@ int set_sysfs_nodir(char *name, int val);
 int set_configfs_members(struct lockspace *ls, char *name,
 			 int new_count, int *new_members,
 			 int renew_count, int *renew_members);
-int add_configfs_node(int nodeid, char *addr, int addrlen, int local);
+int add_configfs_node(int nodeid, char *addr, int addrlen, int local,
+		      uint32_t mark);
 void del_configfs_node(int nodeid);
 void clear_configfs(void);
 int setup_configfs_options(void);
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 022a6c7c..b330f88d 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -2047,6 +2047,10 @@ int main(int argc, char **argv)
 	set_opt_cli(argc, argv);
 	set_opt_file(0);
 
+	rv = node_config_init(CONF_FILE_PATH);
+	if (rv)
+		return 1;
+
 	strcpy(fence_all_device.name, "fence_all");
 	strcpy(fence_all_device.agent, "dlm_stonith");
 	fence_all_device.unfence = 0;
diff --git a/dlm_controld/member.c b/dlm_controld/member.c
index da3a1f5b..1d5bfa3d 100644
--- a/dlm_controld/member.c
+++ b/dlm_controld/member.c
@@ -109,6 +109,7 @@ static void quorum_callback(quorum_handle_t h, uint32_t quorate,
 {
 	corosync_cfg_node_address_t addrs[MAX_NODE_ADDRESSES];
 	corosync_cfg_node_address_t *addrptr = addrs;
+	const struct node_config *nc;
 	cs_error_t err;
 	int i, j, num_addrs;
 	uint64_t now = monotime();
@@ -163,12 +164,15 @@ static void quorum_callback(quorum_handle_t h, uint32_t quorate,
 				continue;
 			}
 
+			nc = node_config_get(quorum_nodes[i]);
+
 			for (j = 0; j < num_addrs; j++) {
 				add_configfs_node(quorum_nodes[i],
 						  addrptr[j].address,
 						  addrptr[j].address_length,
 						  (quorum_nodes[i] ==
-						   our_nodeid));
+						   our_nodeid),
+						  nc->mark);
 			}
 		}
 	}
diff --git a/dlm_controld/node_config.c b/dlm_controld/node_config.c
new file mode 100644
index 00000000..fe794be7
--- /dev/null
+++ b/dlm_controld/node_config.c
@@ -0,0 +1,82 @@
+/*
+ * Copyright 2020 Red Hat, Inc.
+ *
+ * This copyrighted material is made available to anyone wishing to use,
+ * modify, copy, or redistribute it subject to the terms and conditions
+ * of the GNU General Public License v2 or (at your option) any later version.
+ */
+
+#include "dlm_daemon.h"
+
+#define MAX_LINE 4096
+
+static struct node_config nc[MAX_NODES];
+
+static const struct node_config nc_default = {
+	.mark = 0,
+};
+
+int node_config_init(const char *path)
+{
+	char line[MAX_LINE], tmp[MAX_LINE];
+	unsigned long mark;
+	FILE *file;
+	int nodeid;
+	int rv;
+
+	/* if no config file is given we assume default node configuration */
+	file = fopen(path, "r");
+	if (!file) {
+		log_debug("No config file %s, we assume default node configuration: mark %" PRIu32,
+			  path, nc_default.mark);
+		return 0;
+	}
+
+	while (fgets(line, MAX_LINE, file)) {
+		if (line[0] == '#')
+			continue;
+		if (line[0] == '\n')
+			continue;
+
+		if (!strncmp(line, "node", strlen("node"))) {
+			rv = sscanf(line, "node id=%d mark=%s", &nodeid, tmp);
+			if (rv < 2) {
+				log_error("Invalid configuration line: %s", line);
+				rv = -EINVAL;
+				goto out;
+			}
+
+			/* skip invalid nodeid's */
+			if (nodeid <= 0 || nodeid > MAX_NODES - 1)
+				continue;
+
+			mark = strtoul(tmp, NULL, 0);
+			if (mark == ULONG_MAX) {
+				log_error("Failed to pars mark value %s will use %" PRIu32,
+					  tmp, nc_default.mark);
+				mark = nc_default.mark;
+			}
+			nc[nodeid].mark = mark;
+
+			log_debug("parsed node config id=%d mark=%" PRIu32,
+				  nodeid, mark);
+		}
+	}
+
+	fclose(file);
+	return 0;
+
+out:
+	fclose(file);
+	return rv;
+}
+
+const struct node_config *node_config_get(int nodeid)
+{
+	if (nodeid <= 0 || nodeid > MAX_NODES - 1) {
+		log_debug("node config requested for id=%d returning defaults", nodeid);
+		return &nc_default;
+	}
+
+	return &nc[nodeid];
+}
diff --git a/dlm_controld/node_config.h b/dlm_controld/node_config.h
new file mode 100644
index 00000000..f0a4c2a0
--- /dev/null
+++ b/dlm_controld/node_config.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright 2020 Red Hat, Inc.
+ *
+ * This copyrighted material is made available to anyone wishing to use,
+ * modify, copy, or redistribute it subject to the terms and conditions
+ * of the GNU General Public License v2 or (at your option) any later version.
+ */
+
+#ifndef _NODE_CONFIG_H_
+#define _NODE_CONFIG_H_
+
+#include <stdint.h>
+
+struct node_config {
+	uint32_t mark;
+};
+
+/*
+ * Returns -ENOENT if path does not exist or there is no
+ * config for nodeid in the file.
+ *
+ * Returns -EXYZ if there's a problem with the config.
+ *
+ * Returns 0 if a config was found with no problems.
+ */
+
+int node_config_init(const char *path);
+
+const struct node_config *node_config_get(int nodeid);
+
+#endif
-- 
2.26.2

