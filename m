Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0A66CFCC
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 20:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673898664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=siU7iwd3/VtQNWF5LdoZxlUCw8mo9TqSMVspxjWN4+4=;
	b=SwoWoBEcnj184wONM7iTgeSruiP1uuJaCrUudbFdV4O/V06mrp5bCFknnl5LgiLEtaA+ex
	GRCdYOa7NI3vqJrd2h3JGui8vos8LKEzSmgWf5B+fIoew1ONbKgz3AxQdi1DAlsrt+o/9i
	Yuz0U8/ci/zHz7vEO+GA9QXi0/Dygl0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-_IKXdDRePMyDlZKxYubuBg-1; Mon, 16 Jan 2023 14:51:00 -0500
X-MC-Unique: _IKXdDRePMyDlZKxYubuBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05C831818E46;
	Mon, 16 Jan 2023 19:51:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCA50C15BAD;
	Mon, 16 Jan 2023 19:50:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E77219465B5;
	Mon, 16 Jan 2023 19:50:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A629194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 19:50:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E198914171C0; Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B749714171B8;
 Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 16 Jan 2023 14:50:51 -0500
Message-Id: <20230116195051.2858791-3-aahringo@redhat.com>
In-Reply-To: <20230116195051.2858791-1-aahringo@redhat.com>
References: <20230116195051.2858791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 3/3] dlm_controld: better uevent
 filtering
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When I did test with dlm_locktorture module I got several log messages
about:

uevent message has 3 args: add@/module/dlm_locktorture
uevent message has 3 args: remove@/module/dlm_locktorture

which are not expected and not able to parse by dlm_controld
process_uevent() function, because mismatch of argument counts.
Debugging it more, I figured out that those uevents are for
loading/unloading the dlm_locktorture module and there are uevents for
loading and unloading modules which have nothing todo with dlm lockspace
uevent handling.

The current filter works as:

if (!strstr(buf, "dlm"))

for matching the dlm joining/leaving uevent string which looks like:

offline@/kernel/dlm/locktorture

to avoid matching with other uevent which has somehow the string "dlm"
in it, we switch to the match the uevent env variables for action,
devpath (just to check if it's set) and subsystem. Additional the dlm
subsystem sets the LOCKSPACE variable which can be used to get the
lockspace name instead of extracting it previously from the devpath.

The code to decode the uevent envs were taken from the gfs2_controld
utility [0].

[0] https://github.com/andyprice/gfs2-utils/blob/91c3e9a69ed70d3d522f5b47015da5e5868722ec/group/gfs_controld/main.c
---
 dlm_controld/main.c | 126 +++++++++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 55 deletions(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 31489d54..c9d1c5f1 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -46,6 +46,50 @@ struct client {
 	struct lockspace *ls;
 };
 
+enum {
+	Env_ACTION = 0,
+	Env_DEVPATH,
+	Env_SUBSYSTEM,
+	Env_LOCKSPACE,
+	Env_Last, /* Flag for end of vars */
+};
+
+static const char *uevent_vars[] = {
+	[Env_ACTION]		= "ACTION=",
+	[Env_DEVPATH]		= "DEVPATH=",
+	[Env_SUBSYSTEM]		= "SUBSYSTEM=",
+	[Env_LOCKSPACE]		= "LOCKSPACE=",
+};
+
+static void decode_uevent(const char *buf, unsigned len, const char *vars[],
+			  unsigned nvars, const char *vals[])
+{
+	const char *ptr;
+	unsigned int i;
+	int slen, vlen;
+
+	memset(vals, 0, sizeof(const char *) * nvars);
+
+	while (len > 0) {
+		ptr = buf;
+		slen = strlen(ptr);
+		buf += slen;
+		len -= slen;
+		buf++;
+		len--;
+
+		for (i = 0; i < nvars; i++) {
+			vlen = strlen(vars[i]);
+			if (vlen > slen)
+				continue;
+			if (memcmp(vars[i], ptr, vlen) != 0)
+				continue;
+			vals[i] = ptr + vlen;
+			break;
+		}
+	}
+}
+
 int do_read(int fd, void *buf, size_t count)
 {
 	int rv, off = 0;
@@ -627,38 +671,6 @@ static void fs_register_del(char *name)
 	}
 }
 
-#define MAXARGS 8
-
-static char *get_args(char *buf, int *argc, char **argv, char sep, int want)
-{
-	char *p = buf, *rp = NULL;
-	int i;
-
-	argv[0] = p;
-
-	for (i = 1; i < MAXARGS; i++) {
-		p = strchr(buf, sep);
-		if (!p)
-			break;
-		*p = '\0';
-
-		if (want == i) {
-			rp = p + 1;
-			break;
-		}
-
-		argv[i] = p + 1;
-		buf = p + 1;
-	}
-	*argc = i;
-
-	/* we ended by hitting \0, return the point following that */
-	if (!rp)
-		rp = strchr(buf, '\0') + 1;
-
-	return rp;
-}
-
 const char *dlm_mode_str(int mode)
 {
 	switch (mode) {
@@ -686,13 +698,12 @@ const char *dlm_mode_str(int mode)
 
 static void process_uevent(int ci)
 {
+	const char *uevent_vals[Env_Last];
 	struct lockspace *ls;
 	char buf[MAX_LINE_UEVENT];
-	char *argv[MAXARGS], *act, *sys;
-	int rv, argc = 0;
+	int rv;
 
 	memset(buf, 0, sizeof(buf));
-	memset(argv, 0, sizeof(char *) * MAXARGS);
 
  retry_recv:
 	rv = recv(client[ci].fd, &buf, sizeof(buf), 0);
@@ -704,35 +715,38 @@ static void process_uevent(int ci)
 		return;
 	}
 
-	if (!strstr(buf, "dlm"))
-		return;
+	decode_uevent(buf, rv, uevent_vars, Env_Last, uevent_vals);
 
-	log_debug("uevent: %s", buf);
-
-	get_args(buf, &argc, argv, '/', 4);
-	if (argc != 4)
-		log_error("uevent message has %d args", argc);
-	act = argv[0];
-	sys = argv[2];
-
-	if (!act || !sys || !argv[3])
+	if (!uevent_vals[Env_ACTION] ||
+	    !uevent_vals[Env_DEVPATH] ||
+	    !uevent_vals[Env_SUBSYSTEM] ||
+	    !uevent_vals[Env_LOCKSPACE]) {
+		log_debug("failed to validate uevent, action: %p, devpath: %p, subsystem: %p, lockspace: %p",
+			  uevent_vals[Env_ACTION], uevent_vals[Env_DEVPATH],
+			  uevent_vals[Env_SUBSYSTEM],
+			  uevent_vals[Env_LOCKSPACE]);
 		return;
+	}
 
-	if (strncmp(sys, "dlm", 3))
+	if (strcmp(uevent_vals[Env_SUBSYSTEM], "dlm")) {
+		log_debug("uevent looks like dlm but came not from dlm subsystem");
 		return;
+	}
 
-	log_debug("kernel: %s %s", act, argv[3]);
+	log_debug("uevent action: %s, devpath: %s, devpath: %s, lockspace: %s",
+		  uevent_vals[Env_ACTION], uevent_vals[Env_SUBSYSTEM],
+		  uevent_vals[Env_DEVPATH], uevent_vals[Env_LOCKSPACE]);
 
 	rv = 0;
 
-	if (!strcmp(act, "online@")) {
-		ls = find_ls(argv[3]);
+	if (!strcmp(uevent_vals[Env_ACTION], "online")) {
+		ls = find_ls(uevent_vals[Env_LOCKSPACE]);
 		if (ls) {
 			rv = -EEXIST;
 			goto out;
 		}
 
-		ls = create_ls(argv[3]);
+		ls = create_ls(uevent_vals[Env_LOCKSPACE]);
 		if (!ls) {
 			rv = -ENOMEM;
 			goto out;
@@ -747,8 +761,8 @@ static void process_uevent(int ci)
 			goto out;
 		}
 
-	} else if (!strcmp(act, "offline@")) {
-		ls = find_ls(argv[3]);
+	} else if (!strcmp(uevent_vals[Env_ACTION], "offline")) {
+		ls = find_ls(uevent_vals[Env_LOCKSPACE]);
 		if (!ls) {
 			rv = -ENOENT;
 			goto out;
@@ -758,8 +772,10 @@ static void process_uevent(int ci)
 	}
  out:
 	if (rv < 0)
-		log_error("process_uevent %s error %d errno %d",
-			  act, rv, errno);
+		log_error("%s action: %s, devpath: %s, devpath: %s, lockspace: %s - error %d errno %d",
+			  __func__, uevent_vals[Env_ACTION],
+			  uevent_vals[Env_SUBSYSTEM], uevent_vals[Env_DEVPATH],
+			  uevent_vals[Env_LOCKSPACE], rv, errno);
 }
 
 static int setup_uevent(void)
-- 
2.31.1

