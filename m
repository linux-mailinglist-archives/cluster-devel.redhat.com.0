Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 75BC425DBBB
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Sep 2020 16:30:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-5bZWgGbDNp6NxlQAj6wWoA-1; Fri, 04 Sep 2020 10:30:39 -0400
X-MC-Unique: 5bZWgGbDNp6NxlQAj6wWoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2601017DCE;
	Fri,  4 Sep 2020 14:30:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7C25D9CC;
	Fri,  4 Sep 2020 14:30:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C80D18561B1;
	Fri,  4 Sep 2020 14:30:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084EUVTs010855 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 10:30:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFD681992F; Fri,  4 Sep 2020 14:30:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-30.rdu2.redhat.com [10.10.117.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 529BE19C59;
	Fri,  4 Sep 2020 14:30:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  4 Sep 2020 10:29:46 -0400
Message-Id: <20200904142946.8684-2-aahringo@redhat.com>
In-Reply-To: <20200904142946.8684-1-aahringo@redhat.com>
References: <20200904142946.8684-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 2/2] dlm_controld: set SO_RCVBUF
	for netlink socket
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Saw some:

1597148652 uevent recv error -1 errno 105

on a dlm_tool dump. The errno 105 is ENOBUFS on an recv of an AF_NETLINK
socket. Further investigations showed that we dropping uevents in such
case, see the added comment. The above error message was on a node which
hung inside do_uevent() of dlm kernel code which means that the
node is waiting for a sysfs write of "event_done". My guess is that
dlm_controld dropped some "important" messages and never writes to
"event_done" in this case. However we should prevent such ENOBUFS cases
in netlink which this patch is trying to do in a simple way.
---
 dlm_controld/dlm_daemon.h |  2 ++
 dlm_controld/main.c       | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 0b4ae5f2..95848201 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -83,6 +83,8 @@
 #define DEFAULT_LOGFILE_PRIORITY LOG_INFO
 #define DEFAULT_LOGFILE          LOG_FILE_PATH
 
+#define DEFAULT_NETLINK_RCVBUF	(2 * 1024 * 1024)
+
 enum {
         no_arg = 0,
         req_arg_bool = 1,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 470a067c..a82fc9c2 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -765,6 +765,7 @@ static void process_uevent(int ci)
 static int setup_uevent(void)
 {
 	struct sockaddr_nl snl;
+	int rcvbuf;
 	int s, rv;
 
 	s = socket(AF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
@@ -773,6 +774,24 @@ static int setup_uevent(void)
 		return s;
 	}
 
+	/* man 7 netlink:
+	 *
+	 * However,  reliable  transmissions from kernel to user are impossible in
+	 * any case.  The kernel can't send a netlink message if the socket buffer
+	 * is  full: the message will be dropped and the kernel and the user-space
+	 * process will no longer have the same view of kernel state.  It is up to
+	 * the  application  to  detect  when  this happens (via the ENOBUFS error
+	 * returned by recvmsg(2)) and resynchronize.
+	 *
+	 * To prevent ENOBUFS errors we just set the receive buffer to two
+	 * megabyte as other applications do it. This will not ensure that we never
+	 * receive ENOBUFS but it's more unlikely. May it's worth to handle ENOBUFS
+	 * errors on a different way in future.
+	 */
+	rcvbuf = DEFAULT_NETLINK_RCVBUF;
+	setsockopt(s, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
+	setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &rcvbuf, sizeof(rcvbuf));
+
 	memset(&snl, 0, sizeof(snl));
 	snl.nl_family = AF_NETLINK;
 	snl.nl_pid = getpid();
-- 
2.26.2

