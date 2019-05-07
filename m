Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D716539
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 15:57:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69AFB309703F;
	Tue,  7 May 2019 13:57:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91EDE2657F;
	Tue,  7 May 2019 13:57:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55E6118089CB;
	Tue,  7 May 2019 13:57:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47Duth0007555 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 09:56:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E805817F3F; Tue,  7 May 2019 13:56:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.com (ovpn-117-83.phx2.redhat.com [10.3.117.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77B13608CA;
	Tue,  7 May 2019 13:56:55 +0000 (UTC)
From: David Windsor <dwindsor@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 09:56:53 -0400
Message-Id: <20190507135653.9224-1-dwindsor@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/1] dlm_controld: bind to all interfaces
	for failover
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 07 May 2019 13:57:08 +0000 (UTC)

Support for automatic failover in the face of network interruptions
is being added to the DLM kernel component. [1] This patch aids in that
effort by adding a mechanism whereby userspace can convey to the
kernel its intention to use all network addresses for automatic
failover.  DLM's current default behavior is to bind to only a single
interface.

When --bind_all is set, dlm_controld will write to a configfs
node that alerts the kernel of its intention to use all local network
addresses for automatic failover. When selecting the next address to
bind to, DLM will iterate through its list of local network addresses
in a round-robin fashion.  Support for other address selection
heuritics may be added in the future.

It is important to understand that, per the DLM spec, while DLM
can use a set of addresses for automatic failover, only one address
is considered the active address between two DLM nodes at a time.
This patch does not violate that constraint.

[1] https://www.redhat.com/archives/cluster-devel/2019-January/msg00009.html

Signed-off-by: David Windsor <dwindsor@redhat.com>
---
 dlm_controld/action.c     | 19 +++++++++++++++++++
 dlm_controld/dlm.conf.5   |  2 ++
 dlm_controld/dlm_daemon.h |  1 +
 dlm_controld/main.c       |  5 +++++
 4 files changed, 27 insertions(+)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index 84637f15..ecd0d022 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -662,6 +662,25 @@ int add_configfs_node(int nodeid, char *addr, int addrlen, int local)
 		return -1;
 	}
 	close(fd);
+
+	if (opt(bind_all_ind)) {
+		memset(path, 0, PATH_MAX);
+		snprintf(path, PATH_MAX, "%s/%d/bind_all", COMMS_DIR, nodeid);
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
  out:
 	return 0;
 }
diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 616b60da..09492176 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -38,6 +38,8 @@ log_debug
 .br
 protocol
 .br
+bind_all
+.br
 debug_logfile
 .br
 enable_plock
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 1182c971..3221e19c 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -95,6 +95,7 @@ enum {
         timewarn_ind,
         protocol_ind,
         debug_logfile_ind,
+	bind_all_ind,
         enable_fscontrol_ind,
         enable_plock_ind,
         plock_debug_ind,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 1b60ccda..8be6a4bc 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1727,6 +1727,11 @@ static void set_opt_defaults(void)
 			-1, "detect",
 			"dlm kernel lowcomms protocol: tcp, sctp, detect");
 
+	set_opt_default(bind_all_ind,
+			"bind_all", '\0', req_arg_int,
+			0, NULL,
+			""); /* do not advertise */
+
 	set_opt_default(debug_logfile_ind,
 			"debug_logfile", 'L', no_arg,
 			0, NULL,
-- 
2.20.1

