Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A3557117
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 04:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655951602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hKI6q9C9MCuOG3hjk1HbvUZRabssncC2sMgDxkRGKMk=;
	b=Ou4rT9ApSvvSKijVOUonxH+sXDcLj7ki47HoRojhOcJ9XLhV+dFx+ZweEBMgXaiK3ILQU9
	ugHFQH3lEh3v5Vlzt4vZNz5bQ0nBNEccpC6L8ycRPmnmHB5vHLgH/zRecKezml3xerGLtg
	DX6l4rdH3jaUW4YKIBsdm+qFozPovWA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-RqxQ3rr0NWi8HJP5TlMMvw-1; Wed, 22 Jun 2022 22:33:18 -0400
X-MC-Unique: RqxQ3rr0NWi8HJP5TlMMvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24B5729DD9B3;
	Thu, 23 Jun 2022 02:33:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 380531121314;
	Thu, 23 Jun 2022 02:33:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CD06D194B94A;
	Thu, 23 Jun 2022 02:33:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 000FE194B940 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C58D71121315; Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A29B21121314;
 Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 22:33:11 -0400
Message-Id: <20220623023311.1934436-3-aahringo@redhat.com>
In-Reply-To: <20220623023311.1934436-1-aahringo@redhat.com>
References: <20220623023311.1934436-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm-tool 3/3] controld: remove timewarn
 handling
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The netlink implementation is actually not build and the timewarn
setting in controld would only activate some debugging warning if some
lock requests got stucked without any other notification mechanism e.g.
netlink. We remove this handling now because the dlm kernel
implementation deprecates this feature.
---
 dlm_controld/action.c             |   4 -
 dlm_controld/dlm_daemon.h         |   1 -
 dlm_controld/main.c               |   5 -
 dlm_controld/netlink.c            | 232 ------------------------------
 dlm_tool/dlm_tool.8               |   3 +-
 libdlm/man/dlm_create_lockspace.3 |   6 +-
 6 files changed, 2 insertions(+), 249 deletions(-)
 delete mode 100644 dlm_controld/netlink.c

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index baddaf81..67aa6896 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -882,10 +882,6 @@ int setup_configfs_options(void)
 	    dlm_options[log_debug_ind].file_set)
 		set_configfs_cluster("log_debug", NULL, opt(log_debug_ind));
 
-	if (dlm_options[timewarn_ind].cli_set ||
-	    dlm_options[timewarn_ind].file_set)
-		set_configfs_cluster("timewarn_cs", NULL, opt(timewarn_ind));
-
 	if (dlm_options[port_ind].cli_set ||
 	    dlm_options[port_ind].file_set)
 		set_configfs_cluster("tcp_port", NULL, optu(port_ind));
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 22e286fc..b829e0de 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -102,7 +102,6 @@ enum {
         daemon_debug_ind = 0,
         foreground_ind,
         log_debug_ind,
-        timewarn_ind,
         protocol_ind,
         port_ind,
         debug_logfile_ind,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index a98dae56..80fe14bd 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1796,11 +1796,6 @@ static void set_opt_defaults(void)
 			0, NULL, 0, 1,
 			"enable kernel dlm debugging messages");
 
-	set_opt_default(timewarn_ind,
-			"timewarn", '\0', req_arg_int,
-			0, NULL, 0, 0,
-			""); /* do not advertise */
-
 	set_opt_default(protocol_ind,
 			"protocol", 'r', req_arg_str,
 			-1, "detect", 0, 0,
diff --git a/dlm_controld/netlink.c b/dlm_controld/netlink.c
deleted file mode 100644
index 5f221dcf..00000000
--- a/dlm_controld/netlink.c
+++ /dev/null
@@ -1,232 +0,0 @@
-/*
- * Copyright 2004-2012 Red Hat, Inc.
- *
- * This copyrighted material is made available to anyone wishing to use,
- * modify, copy, or redistribute it subject to the terms and conditions
- * of the GNU General Public License v2 or (at your option) any later version.
- */
-
-#include "dlm_daemon.h"
-#include <linux/dlm.h>
-#include <linux/netlink.h>
-#include <linux/genetlink.h>
-#include <linux/dlm_netlink.h>
-
-#define DEADLOCK_CHECK_SECS		10
-
-/* FIXME: look into using libnl/libnetlink */
-
-#define GENLMSG_DATA(glh)       ((void *)((char *)NLMSG_DATA(glh) + GENL_HDRLEN))
-#define GENLMSG_PAYLOAD(glh)    (NLMSG_PAYLOAD(glh, 0) - GENL_HDRLEN)
-#define NLA_DATA(na)	    	((void *)((char*)(na) + NLA_HDRLEN))
-#define NLA_PAYLOAD(len)	(len - NLA_HDRLEN)
-
-/* Maximum size of response requested or message sent */
-#define MAX_MSG_SIZE    1024
-
-struct msgtemplate {
-	struct nlmsghdr n;
-	struct genlmsghdr g;
-	char buf[MAX_MSG_SIZE];
-};
-
-static int send_genetlink_cmd(int sd, uint16_t nlmsg_type, uint32_t nlmsg_pid,
-			      uint8_t genl_cmd, uint16_t nla_type,
-			      void *nla_data, int nla_len)
-{
-	struct nlattr *na;
-	struct sockaddr_nl nladdr;
-	int r, buflen;
-	char *buf;
-
-	struct msgtemplate msg;
-
-	msg.n.nlmsg_len = NLMSG_LENGTH(GENL_HDRLEN);
-	msg.n.nlmsg_type = nlmsg_type;
-	msg.n.nlmsg_flags = NLM_F_REQUEST;
-	msg.n.nlmsg_seq = 0;
-	msg.n.nlmsg_pid = nlmsg_pid;
-	msg.g.cmd = genl_cmd;
-	msg.g.version = 0x1;
-	na = (struct nlattr *) GENLMSG_DATA(&msg);
-	na->nla_type = nla_type;
-	na->nla_len = nla_len + 1 + NLA_HDRLEN;
-	if (nla_data)
-		memcpy(NLA_DATA(na), nla_data, nla_len);
-	msg.n.nlmsg_len += NLMSG_ALIGN(na->nla_len);
-
-	buf = (char *) &msg;
-	buflen = msg.n.nlmsg_len ;
-	memset(&nladdr, 0, sizeof(nladdr));
-	nladdr.nl_family = AF_NETLINK;
-	while ((r = sendto(sd, buf, buflen, 0, (struct sockaddr *) &nladdr,
-			   sizeof(nladdr))) < buflen) {
-		if (r > 0) {
-			buf += r;
-			buflen -= r;
-		} else if (errno != EAGAIN)
-			return -1;
-	}
-	return 0;
-}
-
-/*
- * Probe the controller in genetlink to find the family id
- * for the DLM family
- */
-static int get_family_id(int sd)
-{
-	char genl_name[100];
-	struct {
-		struct nlmsghdr n;
-		struct genlmsghdr g;
-		char buf[256];
-	} ans;
-
-	int id = 0, rc;
-	struct nlattr *na;
-	int rep_len;
-
-	strcpy(genl_name, DLM_GENL_NAME);
-	rc = send_genetlink_cmd(sd, GENL_ID_CTRL, getpid(), CTRL_CMD_GETFAMILY,
-				CTRL_ATTR_FAMILY_NAME, (void *)genl_name,
-				strlen(DLM_GENL_NAME)+1);
-
-	rep_len = recv(sd, &ans, sizeof(ans), 0);
-	if (ans.n.nlmsg_type == NLMSG_ERROR ||
-	    (rep_len < 0) || !NLMSG_OK((&ans.n), rep_len))
-		return 0;
-
-	na = (struct nlattr *) GENLMSG_DATA(&ans);
-	na = (struct nlattr *) ((char *) na + NLA_ALIGN(na->nla_len));
-	if (na->nla_type == CTRL_ATTR_FAMILY_ID) {
-		id = *(uint16_t *) NLA_DATA(na);
-	}
-	return id;
-}
-
-/* genetlink messages are timewarnings used as part of deadlock detection */
-
-int setup_netlink(void)
-{
-	struct sockaddr_nl snl;
-	int s, rv;
-	uint16_t id;
-
-	s = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
-	if (s < 0) {
-		log_error("generic netlink socket");
-		return s;
-	}
-
-	memset(&snl, 0, sizeof(snl));
-	snl.nl_family = AF_NETLINK;
-
-	rv = bind(s, (struct sockaddr *) &snl, sizeof(snl));
-	if (rv < 0) {
-		log_error("gen netlink bind error %d errno %d", rv, errno);
-		close(s);
-		return rv;
-	}
-
-	id = get_family_id(s);
-	if (!id) {
-		log_error("Error getting family id, errno %d", errno);
-		close(s);
-		return -1;
-	}
-
-	rv = send_genetlink_cmd(s, id, getpid(), DLM_CMD_HELLO, 0, NULL, 0);
-	if (rv < 0) {
-		log_error("error sending hello cmd, errno %d", errno);
-		close(s);
-		return -1;
-	}
-
-	return s;
-}
-
-static void process_timewarn(struct dlm_lock_data *data)
-{
-	struct lockspace *ls;
-	struct timeval now;
-	unsigned int sec;
-
-	ls = find_ls_id(data->lockspace_id);
-	if (!ls)
-		return;
-
-	data->resource_name[data->resource_namelen] = '\0';
-
-	log_group(ls, "timewarn: lkid %x pid %d name %s",
-		  data->id, data->ownpid, data->resource_name);
-
-	/* Problem: we don't want to get a timewarn, assume it's resolved
-	   by the current cycle, but in fact it's from a deadlock that
-	   formed after the checkpoints for the current cycle.  Then we'd
-	   have to hope for another warning (that may not come) to trigger
-	   a new cycle to catch the deadlock.  If our last cycle ckpt
-	   was say N (~5?) sec before we receive the timewarn, then we
-	   can be confident that the cycle included the lock in question.
-	   Otherwise, we're not sure if the warning is for a new deadlock
-	   that's formed since our last cycle ckpt (unless it's a long
-	   enough time since the last cycle that we're confident it *is*
-	   a new deadlock).  When there is a deadlock, I suspect it will
-	   be common to receive warnings before, during, and possibly
-	   after the cycle that resolves it.  Wonder if we should record
-	   timewarns and match them with deadlock cycles so we can tell
-	   which timewarns are addressed by a given cycle and which aren't.  */
-
-
-	gettimeofday(&now, NULL);
-
-	/* don't send a new start until at least SECS after the last
-	   we sent, and at least SECS after the last completed cycle */
-
-	sec = now.tv_sec - ls->last_send_cycle_start.tv_sec;
-
-	if (sec < DEADLOCK_CHECK_SECS) {
-		log_group(ls, "skip send: recent send cycle %d sec", sec);
-		return;
-	}
-
-	sec = now.tv_sec - ls->cycle_end_time.tv_sec;
-
-	if (sec < DEADLOCK_CHECK_SECS) {
-		log_group(ls, "skip send: recent cycle end %d sec", sec);
-		return;
-	}
-
-	gettimeofday(&ls->last_send_cycle_start, NULL);
-
-	if (cfgd_enable_deadlk)
-		send_cycle_start(ls);
-}
-
-void process_netlink(int ci)
-{
-	struct msgtemplate msg;
-	struct nlattr *na;
-	int len;
-	int fd;
-
-	fd = client_fd(ci);
-
-	len = recv(fd, &msg, sizeof(msg), 0);
-
-	if (len < 0) {
-		log_error("nonfatal netlink error: errno %d", errno);
-		return;
-	}
-
-	if (msg.n.nlmsg_type == NLMSG_ERROR || !NLMSG_OK((&msg.n), len)) {
-		struct nlmsgerr *err = NLMSG_DATA(&msg);
-		log_error("fatal netlink error: errno %d", err->error);
-		return;
-	}
-
-	na = (struct nlattr *) GENLMSG_DATA(&msg);
-
-	process_timewarn((struct dlm_lock_data *) NLA_DATA(na));
-}
-
diff --git a/dlm_tool/dlm_tool.8 b/dlm_tool/dlm_tool.8
index 2a14fe02..7c670ddb 100644
--- a/dlm_tool/dlm_tool.8
+++ b/dlm_tool/dlm_tool.8
@@ -198,12 +198,11 @@ $ dlm_tool dump_config | head -n 5
 daemon_debug=1 (set_config)
 foreground=0
 log_debug=1 (dlm.conf)
-timewarn=0
 protocol=detect
 .fi
 
 In this case, daemon_debug is set by set_config, log_debug is set from
-dlm.conf, foreground, timewarn and protocol are using default values.
+dlm.conf, foreground and protocol are using default values.
 
 .SS set_config
 
diff --git a/libdlm/man/dlm_create_lockspace.3 b/libdlm/man/dlm_create_lockspace.3
index 93ffc54e..aa6f5aed 100644
--- a/libdlm/man/dlm_create_lockspace.3
+++ b/libdlm/man/dlm_create_lockspace.3
@@ -43,11 +43,7 @@ int dlm_new_lockspace(const char *name, mode_t mode, uint32_t flags)
 .PP
 Performs the same function as 
 .B dlm_create_lockspace()
-above, but passes some creation flags to the call that affect the lockspace being created. Currently supported flags are:
-.nf
-DLM_LSFL_TIMEWARN the dlm should emit warnings over netlink when locks
-                  have been waiting too long; required for deadlock
-                  detection
+above, but passes some creation flags to the call that affect the lockspace being created.
 .fi
 .SS
 int dlm_release_lockspace(const char *name, dlm_lshandle_t ls, int force)
-- 
2.31.1

