Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B376E3CCE2
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Jun 2019 15:27:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1C6237EEF;
	Tue, 11 Jun 2019 13:27:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 903D45D705;
	Tue, 11 Jun 2019 13:27:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8E0A206D1;
	Tue, 11 Jun 2019 13:27:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BDLoje019281 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 09:21:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CABD611A1; Tue, 11 Jun 2019 13:21:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from titanium.redhat.com (ovpn-121-135.rdu2.redhat.com
	[10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC2260DCA;
	Tue, 11 Jun 2019 13:21:47 +0000 (UTC)
From: David Windsor <dwindsor@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 11 Jun 2019 09:21:45 -0400
Message-Id: <20190611132145.6840-1-dwindsor@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] dlm_controld: trigger network interface
	failover if a communications error is detected
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 11 Jun 2019 13:27:49 +0000 (UTC)

Support for automatic failover in the face of network interruptions
is being added to the DLM kernel component [1].  This patch aids in that
effort by adding a mechanism whereby userspace can request the DLM
kernel component switch to the next usable network interface.

When --failover is set, dlm_controld will write to a configfs node that
alerts the DLM kernel component to the fact that a communications error
has occurred in userspace.  The kernel then reinitializes the DLM
communications stack, binding to the next usable network interface.
The kernel implements a round-robin mechanism for selecting the next
network interface.  If necessary, other interface selection heuristics
may be added later.

[1] https://www.redhat.com/archives/cluster-devel/2019-January/msg00009.html

Signed-off-by: David Windsor <dwindsor@redhat.com>

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index ecd0d022..c107092d 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -639,6 +639,28 @@ int add_configfs_node(int nodeid, char *addr, int addrlen, int local)
 	}
 	close(fd);
 
+	/*
+	 * set failover policy
+	 */
+	if opt(failover_ind) {
+		memset(path, 0, PATH_MAX);
+		snprintf(path, PATH_MAX, "%s/failover", COMMS_DIR);
+
+		fd = open(path, O_WRONLY);
+		if (fd < 0) {
+			log_error("%s: open failed: %d", path, errno);
+			return -1;
+		}
+
+		rv = do_write(fd, (void *)"1", strlen("1"));
+		if (rv < 0) {
+			log_error("%s: write failed: %d", path, errno);
+			close(fd);
+			return -1;
+		}
+		close(fd);
+	}
+
 	/*
 	 * set local
 	 */
@@ -681,6 +703,7 @@ int add_configfs_node(int nodeid, char *addr, int addrlen, int local)
 		}
 		close(fd);
 	}
+
  out:
 	return 0;
 }
@@ -907,6 +930,34 @@ int setup_configfs_members(void)
 	return 0;
 }
 
+/*
+ * Write to the configfs node triggering a switch to the next DLM
+ * failover network interface.
+ */
+int configfs_next_addr(void)
+{
+	int fd, rv;
+	char path[PATH_MAX];
+
+        memset(path, 0, PATH_MAX);
+        snprintf(path, PATH_MAX, "%s/error", COMMS_DIR);
+
+        fd = open(path, O_WRONLY);
+        if (fd < 0) {
+                log_error("%s: open failed: %d", path, errno);
+                return -1;
+        }
+
+        rv = do_write(fd, (void *)"1", strlen("1"));
+        if (rv < 0) {
+                log_error("%s: write failed: %d", path, errno);
+                close(fd);
+                return -1;
+        }
+        close(fd);
+	return 0;
+}
+
 static void find_minors(void)
 {
 	FILE *fl;
diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 09492176..f086dfb1 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -40,6 +40,8 @@ protocol
 .br
 bind_all
 .br
+failover
+.br
 debug_logfile
 .br
 enable_plock
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 3221e19c..9f244fd0 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -96,6 +96,7 @@ enum {
         protocol_ind,
         debug_logfile_ind,
 	bind_all_ind,
+	failover_ind,
         enable_fscontrol_ind,
         enable_plock_ind,
         plock_debug_ind,
@@ -363,6 +364,7 @@ void del_configfs_node(int nodeid);
 void clear_configfs(void);
 int setup_configfs_options(void);
 int setup_configfs_members(void);
+int configfs_next_addr(void);
 int check_uncontrolled_lockspaces(void);
 int setup_misc_devices(void);
 int path_exists(const char *path);
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 8be6a4bc..ca19eac9 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1501,6 +1501,7 @@ static int loop(void)
 			if (pollfd[i].revents & (POLLERR | POLLHUP | POLLNVAL)) {
 				deadfn = client[i].deadfn;
 				deadfn(i);
+				configfs_next_addr();
 			}
 		}
 		query_unlock();
@@ -1732,6 +1733,11 @@ static void set_opt_defaults(void)
 			0, NULL,
 			""); /* do not advertise */
 
+	set_opt_default(failover_ind,
+			"failover", '\0', req_arg_int,
+			0, NULL,
+			""); /* do not advertise */
+
 	set_opt_default(debug_logfile_ind,
 			"debug_logfile", 'L', no_arg,
 			0, NULL,
@@ -2096,4 +2102,3 @@ int main(int argc, char **argv)
 	unlink_lockfile(fd, RUNDIR, RUN_FILE_NAME);
 	return rv < 0 ? 1 : 0;
 }
-
-- 
2.21.0

