Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBBD7654DE
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+jeYyWXaCeQqe4e5xGaddeAz5FOLlj7wngmWNfSDrPA=;
	b=ccK1DSON+QJ3jhizGbNHdjJSLh+SXYp+Nks2uT/RagT7aWRudKs6Ut5cBNYbUbLiqMr5qa
	qaPGDA7JNTgYu/49kt6S/0EtrEJJ/4qU3wgs11kgbVPIbZNmWfIoCi8GzofcK8LWAZ1Hxg
	s4bxhTSTscBgmOZC1xbFzG/gF1ZjNAA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-iS8_X6vvOTS_7DlN1MRHKg-1; Thu, 27 Jul 2023 09:23:14 -0400
X-MC-Unique: iS8_X6vvOTS_7DlN1MRHKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6268E1C06EEC;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC604094DC0;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E8FB71946A75;
	Thu, 27 Jul 2023 13:23:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9698C1946A72 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 770444094DC3; Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 504F64094DC0;
 Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:23:01 -0400
Message-Id: <20230727132303.3352514-11-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 11/13] fs: dlm: constify receive
 buffer
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The dlm receive buffer should be never manipulated as DLM is the last
instance of parsing layer. This patch constify the whole receive buffer
so we are sure it never gets manipulated when it's being parsed.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dir.c          |   5 +-
 fs/dlm/dir.h          |   4 +-
 fs/dlm/lock.c         | 109 ++++++++++++++++++++++--------------------
 fs/dlm/lock.h         |  14 +++---
 fs/dlm/member.c       |   2 +-
 fs/dlm/member.h       |   2 +-
 fs/dlm/midcomms.c     |  16 ++++---
 fs/dlm/rcom.c         |  20 ++++----
 fs/dlm/rcom.h         |   5 +-
 fs/dlm/recover.c      |   2 +-
 fs/dlm/recover.h      |   2 +-
 fs/dlm/requestqueue.c |   3 +-
 fs/dlm/requestqueue.h |   3 +-
 13 files changed, 101 insertions(+), 86 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index 768cf8d43b2b..f6acba4310a7 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -196,7 +196,8 @@ int dlm_recover_directory(struct dlm_ls *ls, uint64_t seq)
 	return error;
 }
 
-static struct dlm_rsb *find_rsb_root(struct dlm_ls *ls, char *name, int len)
+static struct dlm_rsb *find_rsb_root(struct dlm_ls *ls, const char *name,
+				     int len)
 {
 	struct dlm_rsb *r;
 	uint32_t hash, bucket;
@@ -232,7 +233,7 @@ static struct dlm_rsb *find_rsb_root(struct dlm_ls *ls, char *name, int len)
    for rsb's we're master of and whose directory node matches the requesting
    node.  inbuf is the rsb name last sent, inlen is the name's length */
 
-void dlm_copy_master_names(struct dlm_ls *ls, char *inbuf, int inlen,
+void dlm_copy_master_names(struct dlm_ls *ls, const char *inbuf, int inlen,
  			   char *outbuf, int outlen, int nodeid)
 {
 	struct list_head *list;
diff --git a/fs/dlm/dir.h b/fs/dlm/dir.h
index 0635582da003..39ecb69d7ef3 100644
--- a/fs/dlm/dir.h
+++ b/fs/dlm/dir.h
@@ -16,8 +16,8 @@ int dlm_dir_nodeid(struct dlm_rsb *rsb);
 int dlm_hash2nodeid(struct dlm_ls *ls, uint32_t hash);
 void dlm_recover_dir_nodeid(struct dlm_ls *ls);
 int dlm_recover_directory(struct dlm_ls *ls, uint64_t seq);
-void dlm_copy_master_names(struct dlm_ls *ls, char *inbuf, int inlen,
-	char *outbuf, int outlen, int nodeid);
+void dlm_copy_master_names(struct dlm_ls *ls, const char *inbuf, int inlen,
+			   char *outbuf, int outlen, int nodeid);
 
 #endif				/* __DIR_DOT_H__ */
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 1cf666c7401d..652c51fbbf76 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -86,8 +86,8 @@ static int send_remove(struct dlm_rsb *r);
 static int _request_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static int _cancel_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
-				    struct dlm_message *ms, bool local);
-static int receive_extralen(struct dlm_message *ms);
+				    const struct dlm_message *ms, bool local);
+static int receive_extralen(const struct dlm_message *ms);
 static void do_purge(struct dlm_ls *ls, int nodeid, int pid);
 static void toss_rsb(struct kref *kref);
 
@@ -984,8 +984,8 @@ static void __dlm_master_lookup(struct dlm_ls *ls, struct dlm_rsb *r, int our_no
  * . dlm_master_lookup RECOVER_MASTER (fix_master 1, from_master 0)
  */
 
-int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, char *name, int len,
-		      unsigned int flags, int *r_nodeid, int *result)
+int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, const char *name,
+		      int len, unsigned int flags, int *r_nodeid, int *result)
 {
 	struct dlm_rsb *r = NULL;
 	uint32_t hash, b;
@@ -1106,7 +1106,7 @@ static void dlm_dump_rsb_hash(struct dlm_ls *ls, uint32_t hash)
 	}
 }
 
-void dlm_dump_rsb_name(struct dlm_ls *ls, char *name, int len)
+void dlm_dump_rsb_name(struct dlm_ls *ls, const char *name, int len)
 {
 	struct dlm_rsb *r = NULL;
 	uint32_t hash, b;
@@ -1459,7 +1459,7 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
    set RESEND and dlm_recover_waiters_post() */
 
 static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
-				struct dlm_message *ms)
+				const struct dlm_message *ms)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int overlap_done = 0;
@@ -1557,8 +1557,8 @@ static int remove_from_waiters(struct dlm_lkb *lkb, int mstype)
 /* Handles situations where we might be processing a "fake" or "local" reply in
    which we can't try to take waiters_mutex again. */
 
-static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms,
-				  bool local)
+static int remove_from_waiters_ms(struct dlm_lkb *lkb,
+				  const struct dlm_message *ms, bool local)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error;
@@ -1800,7 +1800,7 @@ static void set_lvb_unlock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 /* lkb is process copy (pc) */
 
 static void set_lvb_lock_pc(struct dlm_rsb *r, struct dlm_lkb *lkb,
-			    struct dlm_message *ms)
+			    const struct dlm_message *ms)
 {
 	int b;
 
@@ -1907,7 +1907,7 @@ static void grant_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 }
 
 static void grant_lock_pc(struct dlm_rsb *r, struct dlm_lkb *lkb,
-			  struct dlm_message *ms)
+			  const struct dlm_message *ms)
 {
 	set_lvb_lock_pc(r, lkb, ms);
 	_grant_lock(r, lkb);
@@ -1945,7 +1945,7 @@ static void munge_demoted(struct dlm_lkb *lkb)
 	lkb->lkb_grmode = DLM_LOCK_NL;
 }
 
-static void munge_altmode(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void munge_altmode(struct dlm_lkb *lkb, const struct dlm_message *ms)
 {
 	if (ms->m_type != cpu_to_le32(DLM_MSG_REQUEST_REPLY) &&
 	    ms->m_type != cpu_to_le32(DLM_MSG_GRANT)) {
@@ -3641,8 +3641,9 @@ static int send_cancel_reply(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
 	return send_common_reply(r, lkb, DLM_MSG_CANCEL_REPLY, rv);
 }
 
-static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
-			     int ret_nodeid, int rv)
+static int send_lookup_reply(struct dlm_ls *ls,
+			     const struct dlm_message *ms_in, int ret_nodeid,
+			     int rv)
 {
 	struct dlm_rsb *r = &ls->ls_local_rsb;
 	struct dlm_message *ms;
@@ -3667,14 +3668,15 @@ static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
    of message, unlike the send side where we can safely send everything about
    the lkb for any type of message */
 
-static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void receive_flags(struct dlm_lkb *lkb, const struct dlm_message *ms)
 {
 	lkb->lkb_exflags = le32_to_cpu(ms->m_exflags);
 	dlm_set_sbflags_val(lkb, le32_to_cpu(ms->m_sbflags));
 	dlm_set_dflags_val(lkb, le32_to_cpu(ms->m_flags));
 }
 
-static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+static void receive_flags_reply(struct dlm_lkb *lkb,
+				const struct dlm_message *ms,
 				bool local)
 {
 	if (local)
@@ -3684,14 +3686,14 @@ static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
 	dlm_set_dflags_val(lkb, le32_to_cpu(ms->m_flags));
 }
 
-static int receive_extralen(struct dlm_message *ms)
+static int receive_extralen(const struct dlm_message *ms)
 {
 	return (le16_to_cpu(ms->m_header.h_length) -
 		sizeof(struct dlm_message));
 }
 
 static int receive_lvb(struct dlm_ls *ls, struct dlm_lkb *lkb,
-		       struct dlm_message *ms)
+		       const struct dlm_message *ms)
 {
 	int len;
 
@@ -3719,7 +3721,7 @@ static void fake_astfn(void *astparam)
 }
 
 static int receive_request_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
-				struct dlm_message *ms)
+				const struct dlm_message *ms)
 {
 	lkb->lkb_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 	lkb->lkb_ownpid = le32_to_cpu(ms->m_pid);
@@ -3741,7 +3743,7 @@ static int receive_request_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 }
 
 static int receive_convert_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
-				struct dlm_message *ms)
+				const struct dlm_message *ms)
 {
 	if (lkb->lkb_status != DLM_LKSTS_GRANTED)
 		return -EBUSY;
@@ -3756,7 +3758,7 @@ static int receive_convert_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 }
 
 static int receive_unlock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
-			       struct dlm_message *ms)
+			       const struct dlm_message *ms)
 {
 	if (receive_lvb(ls, lkb, ms))
 		return -ENOMEM;
@@ -3766,7 +3768,7 @@ static int receive_unlock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 /* We fill in the local-lkb fields with the info that send_xxxx_reply()
    uses to send a reply and that the remote end uses to process the reply. */
 
-static void setup_local_lkb(struct dlm_ls *ls, struct dlm_message *ms)
+static void setup_local_lkb(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb = &ls->ls_local_lkb;
 	lkb->lkb_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
@@ -3776,7 +3778,7 @@ static void setup_local_lkb(struct dlm_ls *ls, struct dlm_message *ms)
 /* This is called after the rsb is locked so that we can safely inspect
    fields in the lkb. */
 
-static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
+static int validate_message(struct dlm_lkb *lkb, const struct dlm_message *ms)
 {
 	int from = le32_to_cpu(ms->m_header.h_nodeid);
 	int error = 0;
@@ -3828,7 +3830,7 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	return error;
 }
 
-static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_request(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -3907,7 +3909,7 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 	return error;
 }
 
-static int receive_convert(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_convert(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -3963,7 +3965,7 @@ static int receive_convert(struct dlm_ls *ls, struct dlm_message *ms)
 	return error;
 }
 
-static int receive_unlock(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_unlock(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -4015,7 +4017,7 @@ static int receive_unlock(struct dlm_ls *ls, struct dlm_message *ms)
 	return error;
 }
 
-static int receive_cancel(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_cancel(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -4051,7 +4053,7 @@ static int receive_cancel(struct dlm_ls *ls, struct dlm_message *ms)
 	return error;
 }
 
-static int receive_grant(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_grant(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -4082,7 +4084,7 @@ static int receive_grant(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 }
 
-static int receive_bast(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_bast(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -4110,7 +4112,7 @@ static int receive_bast(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 }
 
-static void receive_lookup(struct dlm_ls *ls, struct dlm_message *ms)
+static void receive_lookup(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	int len, error, ret_nodeid, from_nodeid, our_nodeid;
 
@@ -4130,7 +4132,7 @@ static void receive_lookup(struct dlm_ls *ls, struct dlm_message *ms)
 	send_lookup_reply(ls, ms, ret_nodeid, error);
 }
 
-static void receive_remove(struct dlm_ls *ls, struct dlm_message *ms)
+static void receive_remove(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	char name[DLM_RESNAME_MAXLEN+1];
 	struct dlm_rsb *r;
@@ -4218,12 +4220,13 @@ static void receive_remove(struct dlm_ls *ls, struct dlm_message *ms)
 	}
 }
 
-static void receive_purge(struct dlm_ls *ls, struct dlm_message *ms)
+static void receive_purge(struct dlm_ls *ls, const struct dlm_message *ms)
 {
 	do_purge(ls, le32_to_cpu(ms->m_nodeid), le32_to_cpu(ms->m_pid));
 }
 
-static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_request_reply(struct dlm_ls *ls,
+				 const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -4345,7 +4348,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 }
 
 static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
-				    struct dlm_message *ms, bool local)
+				    const struct dlm_message *ms, bool local)
 {
 	/* this is the value returned from do_convert() on the master */
 	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
@@ -4388,8 +4391,8 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	}
 }
 
-static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
-				   bool local)
+static void _receive_convert_reply(struct dlm_lkb *lkb,
+				   const struct dlm_message *ms, bool local)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4412,7 +4415,8 @@ static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
 	put_rsb(r);
 }
 
-static int receive_convert_reply(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_convert_reply(struct dlm_ls *ls,
+				 const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	int error;
@@ -4426,8 +4430,8 @@ static int receive_convert_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 }
 
-static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
-				  bool local)
+static void _receive_unlock_reply(struct dlm_lkb *lkb,
+				  const struct dlm_message *ms, bool local)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4463,7 +4467,8 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
 	put_rsb(r);
 }
 
-static int receive_unlock_reply(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_unlock_reply(struct dlm_ls *ls,
+				const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	int error;
@@ -4477,8 +4482,8 @@ static int receive_unlock_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 }
 
-static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
-				  bool local)
+static void _receive_cancel_reply(struct dlm_lkb *lkb,
+				  const struct dlm_message *ms, bool local)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4515,7 +4520,8 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
 	put_rsb(r);
 }
 
-static int receive_cancel_reply(struct dlm_ls *ls, struct dlm_message *ms)
+static int receive_cancel_reply(struct dlm_ls *ls,
+				const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	int error;
@@ -4529,7 +4535,8 @@ static int receive_cancel_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 }
 
-static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
+static void receive_lookup_reply(struct dlm_ls *ls,
+				 const struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
@@ -4608,7 +4615,7 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	dlm_put_lkb(lkb);
 }
 
-static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
+static void _receive_message(struct dlm_ls *ls, const struct dlm_message *ms,
 			     uint32_t saved_seq)
 {
 	int error = 0, noent = 0;
@@ -4744,7 +4751,7 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
    requestqueue, to processing all the saved messages, to processing new
    messages as they arrive. */
 
-static void dlm_receive_message(struct dlm_ls *ls, struct dlm_message *ms,
+static void dlm_receive_message(struct dlm_ls *ls, const struct dlm_message *ms,
 				int nodeid)
 {
 	if (dlm_locking_stopped(ls)) {
@@ -4767,7 +4774,7 @@ static void dlm_receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 /* This is called by dlm_recoverd to process messages that were saved on
    the requestqueue. */
 
-void dlm_receive_message_saved(struct dlm_ls *ls, struct dlm_message *ms,
+void dlm_receive_message_saved(struct dlm_ls *ls, const struct dlm_message *ms,
 			       uint32_t saved_seq)
 {
 	_receive_message(ls, ms, saved_seq);
@@ -4778,9 +4785,9 @@ void dlm_receive_message_saved(struct dlm_ls *ls, struct dlm_message *ms,
    standard locking activity) or an RCOM (recovery message sent as part of
    lockspace recovery). */
 
-void dlm_receive_buffer(union dlm_packet *p, int nodeid)
+void dlm_receive_buffer(const union dlm_packet *p, int nodeid)
 {
-	struct dlm_header *hd = &p->header;
+	const struct dlm_header *hd = &p->header;
 	struct dlm_ls *ls;
 	int type = 0;
 
@@ -5334,7 +5341,7 @@ static struct dlm_lkb *search_remid(struct dlm_rsb *r, int nodeid,
 
 /* needs at least dlm_rcom + rcom_lock */
 static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
-				  struct dlm_rsb *r, struct dlm_rcom *rc)
+				  struct dlm_rsb *r, const struct dlm_rcom *rc)
 {
 	struct rcom_lock *rl = (struct rcom_lock *) rc->rc_buf;
 
@@ -5384,7 +5391,7 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
    back the rcom_lock struct we got but with the remid field filled in. */
 
 /* needs at least dlm_rcom + rcom_lock */
-int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+int dlm_recover_master_copy(struct dlm_ls *ls, const struct dlm_rcom *rc,
 			    __le32 *rl_remid, __le32 *rl_result)
 {
 	struct rcom_lock *rl = (struct rcom_lock *) rc->rc_buf;
@@ -5468,7 +5475,7 @@ int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
 }
 
 /* needs at least dlm_rcom + rcom_lock */
-int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+int dlm_recover_process_copy(struct dlm_ls *ls, const struct dlm_rcom *rc,
 			     uint64_t seq)
 {
 	struct rcom_lock *rl = (struct rcom_lock *) rc->rc_buf;
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index cd67ccfbbf9b..b54e2cbbe6e2 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -12,11 +12,11 @@
 #define __LOCK_DOT_H__
 
 void dlm_dump_rsb(struct dlm_rsb *r);
-void dlm_dump_rsb_name(struct dlm_ls *ls, char *name, int len);
+void dlm_dump_rsb_name(struct dlm_ls *ls, const char *name, int len);
 void dlm_print_lkb(struct dlm_lkb *lkb);
-void dlm_receive_message_saved(struct dlm_ls *ls, struct dlm_message *ms,
+void dlm_receive_message_saved(struct dlm_ls *ls, const struct dlm_message *ms,
 			       uint32_t saved_seq);
-void dlm_receive_buffer(union dlm_packet *p, int nodeid);
+void dlm_receive_buffer(const union dlm_packet *p, int nodeid);
 int dlm_modes_compat(int mode1, int mode2);
 void dlm_put_rsb(struct dlm_rsb *r);
 void dlm_hold_rsb(struct dlm_rsb *r);
@@ -25,8 +25,8 @@ void dlm_scan_rsbs(struct dlm_ls *ls);
 int dlm_lock_recovery_try(struct dlm_ls *ls);
 void dlm_unlock_recovery(struct dlm_ls *ls);
 
-int dlm_master_lookup(struct dlm_ls *ls, int nodeid, char *name, int len,
-		      unsigned int flags, int *r_nodeid, int *result);
+int dlm_master_lookup(struct dlm_ls *ls, int from_nodeid, const char *name,
+		      int len, unsigned int flags, int *r_nodeid, int *result);
 
 int dlm_search_rsb_tree(struct rb_root *tree, const void *name, int len,
 			struct dlm_rsb **r_ret);
@@ -36,9 +36,9 @@ void dlm_purge_mstcpy_locks(struct dlm_rsb *r);
 void dlm_recover_grant(struct dlm_ls *ls);
 int dlm_recover_waiters_post(struct dlm_ls *ls);
 void dlm_recover_waiters_pre(struct dlm_ls *ls);
-int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+int dlm_recover_master_copy(struct dlm_ls *ls, const struct dlm_rcom *rc,
 			    __le32 *rl_remid, __le32 *rl_result);
-int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+int dlm_recover_process_copy(struct dlm_ls *ls, const struct dlm_rcom *rc,
 			     uint64_t seq);
 
 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua, int mode,
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 19f3cd96f3c0..be7909ead71b 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -18,7 +18,7 @@
 #include "midcomms.h"
 #include "lowcomms.h"
 
-int dlm_slots_version(struct dlm_header *h)
+int dlm_slots_version(const struct dlm_header *h)
 {
 	if ((le32_to_cpu(h->h_version) & 0x0000FFFF) < DLM_HEADER_SLOTS)
 		return 0;
diff --git a/fs/dlm/member.h b/fs/dlm/member.h
index 433b2fac9f4a..f61cfde46314 100644
--- a/fs/dlm/member.h
+++ b/fs/dlm/member.h
@@ -18,7 +18,7 @@ void dlm_clear_members_gone(struct dlm_ls *ls);
 int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv,int *neg_out);
 int dlm_is_removed(struct dlm_ls *ls, int nodeid);
 int dlm_is_member(struct dlm_ls *ls, int nodeid);
-int dlm_slots_version(struct dlm_header *h);
+int dlm_slots_version(const struct dlm_header *h);
 void dlm_slot_save(struct dlm_ls *ls, struct dlm_rcom *rc,
 		   struct dlm_member *memb);
 void dlm_slots_copy_out(struct dlm_ls *ls, struct dlm_rcom *rc);
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 8ebffbfdc00a..c125496e03bf 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -499,7 +499,8 @@ static void dlm_pas_fin_ack_rcv(struct midcomms_node *node)
 	spin_unlock(&node->state_lock);
 }
 
-static void dlm_receive_buffer_3_2_trace(uint32_t seq, union dlm_packet *p)
+static void dlm_receive_buffer_3_2_trace(uint32_t seq,
+					 const union dlm_packet *p)
 {
 	switch (p->header.h_cmd) {
 	case DLM_MSG:
@@ -513,7 +514,7 @@ static void dlm_receive_buffer_3_2_trace(uint32_t seq, union dlm_packet *p)
 	}
 }
 
-static void dlm_midcomms_receive_buffer(union dlm_packet *p,
+static void dlm_midcomms_receive_buffer(const union dlm_packet *p,
 					struct midcomms_node *node,
 					uint32_t seq)
 {
@@ -708,7 +709,8 @@ static int dlm_midcomms_version_check_3_2(struct midcomms_node *node)
 	return 0;
 }
 
-static int dlm_opts_check_msglen(union dlm_packet *p, uint16_t msglen, int nodeid)
+static int dlm_opts_check_msglen(const union dlm_packet *p, uint16_t msglen,
+				 int nodeid)
 {
 	int len = msglen;
 
@@ -757,7 +759,7 @@ static int dlm_opts_check_msglen(union dlm_packet *p, uint16_t msglen, int nodei
 	return 0;
 }
 
-static void dlm_midcomms_receive_buffer_3_2(union dlm_packet *p, int nodeid)
+static void dlm_midcomms_receive_buffer_3_2(const union dlm_packet *p, int nodeid)
 {
 	uint16_t msglen = le16_to_cpu(p->header.h_length);
 	struct midcomms_node *node;
@@ -878,7 +880,7 @@ static int dlm_midcomms_version_check_3_1(struct midcomms_node *node)
 	return 0;
 }
 
-static void dlm_midcomms_receive_buffer_3_1(union dlm_packet *p, int nodeid)
+static void dlm_midcomms_receive_buffer_3_1(const union dlm_packet *p, int nodeid)
 {
 	uint16_t msglen = le16_to_cpu(p->header.h_length);
 	struct midcomms_node *node;
@@ -977,10 +979,10 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 
 		switch (hd->h_version) {
 		case cpu_to_le32(DLM_VERSION_3_1):
-			dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
+			dlm_midcomms_receive_buffer_3_1((const union dlm_packet *)ptr, nodeid);
 			break;
 		case cpu_to_le32(DLM_VERSION_3_2):
-			dlm_midcomms_receive_buffer_3_2((union dlm_packet *)ptr, nodeid);
+			dlm_midcomms_receive_buffer_3_2((const union dlm_packet *)ptr, nodeid);
 			break;
 		default:
 			log_print("received invalid version header: %u from node %d, will skip this message",
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 0946431e370a..6ab029149a1d 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -221,7 +221,8 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags,
 	return error;
 }
 
-static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in,
+static void receive_rcom_status(struct dlm_ls *ls,
+				const struct dlm_rcom *rc_in,
 				uint64_t seq)
 {
 	struct dlm_rcom *rc;
@@ -283,7 +284,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in,
 	send_rcom_stateless(msg, rc);
 }
 
-static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
+static void receive_sync_reply(struct dlm_ls *ls, const struct dlm_rcom *rc_in)
 {
 	spin_lock(&ls->ls_rcom_spin);
 	if (!test_bit(LSFL_RCOM_WAIT, &ls->ls_flags) ||
@@ -333,7 +334,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,
 	return error;
 }
 
-static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in,
+static void receive_rcom_names(struct dlm_ls *ls, const struct dlm_rcom *rc_in,
 			       uint64_t seq)
 {
 	struct dlm_rcom *rc;
@@ -376,8 +377,8 @@ int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid, uint64_t seq)
 	return error;
 }
 
-static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in,
-				uint64_t seq)
+static void receive_rcom_lookup(struct dlm_ls *ls,
+				const struct dlm_rcom *rc_in, uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
@@ -408,7 +409,8 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in,
 	send_rcom(mh, rc);
 }
 
-static void receive_rcom_lookup_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
+static void receive_rcom_lookup_reply(struct dlm_ls *ls,
+				      const struct dlm_rcom *rc_in)
 {
 	dlm_recover_master_reply(ls, rc_in);
 }
@@ -469,7 +471,7 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb, uint64_t seq)
 }
 
 /* needs at least dlm_rcom + rcom_lock */
-static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in,
+static void receive_rcom_lock(struct dlm_ls *ls, const struct dlm_rcom *rc_in,
 			      uint64_t seq)
 {
 	__le32 rl_remid, rl_result;
@@ -500,7 +502,7 @@ static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in,
 /* If the lockspace doesn't exist then still send a status message
    back; it's possible that it just doesn't have its global_id yet. */
 
-int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
+int dlm_send_ls_not_ready(int nodeid, const struct dlm_rcom *rc_in)
 {
 	struct dlm_rcom *rc;
 	struct rcom_config *rf;
@@ -578,7 +580,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 /* Called by dlm_recv; corresponds to dlm_receive_message() but special
    recovery-only comms are sent through here. */
 
-void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
+void dlm_receive_rcom(struct dlm_ls *ls, const struct dlm_rcom *rc, int nodeid)
 {
 	int lock_size = sizeof(struct dlm_rcom) + sizeof(struct rcom_lock);
 	int stop, reply = 0, names = 0, lookup = 0, lock = 0;
diff --git a/fs/dlm/rcom.h b/fs/dlm/rcom.h
index 9dd06d43ddb4..765926ae0020 100644
--- a/fs/dlm/rcom.h
+++ b/fs/dlm/rcom.h
@@ -18,8 +18,9 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,
 		   int last_len, uint64_t seq);
 int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid, uint64_t seq);
 int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb, uint64_t seq);
-void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid);
-int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in);
+void dlm_receive_rcom(struct dlm_ls *ls, const struct dlm_rcom *rc,
+		      int nodeid);
+int dlm_send_ls_not_ready(int nodeid, const struct dlm_rcom *rc_in);
 
 #endif
 
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index ddb6b3312cc1..53917c0aa3c0 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -564,7 +564,7 @@ int dlm_recover_masters(struct dlm_ls *ls, uint64_t seq)
 	return error;
 }
 
-int dlm_recover_master_reply(struct dlm_ls *ls, struct dlm_rcom *rc)
+int dlm_recover_master_reply(struct dlm_ls *ls, const struct dlm_rcom *rc)
 {
 	struct dlm_rsb *r;
 	int ret_nodeid, new_master;
diff --git a/fs/dlm/recover.h b/fs/dlm/recover.h
index c5ce2ef13934..dbc51013ecad 100644
--- a/fs/dlm/recover.h
+++ b/fs/dlm/recover.h
@@ -20,7 +20,7 @@ int dlm_recover_directory_wait(struct dlm_ls *ls, uint64_t seq);
 int dlm_recover_locks_wait(struct dlm_ls *ls, uint64_t seq);
 int dlm_recover_done_wait(struct dlm_ls *ls, uint64_t seq);
 int dlm_recover_masters(struct dlm_ls *ls, uint64_t seq);
-int dlm_recover_master_reply(struct dlm_ls *ls, struct dlm_rcom *rc);
+int dlm_recover_master_reply(struct dlm_ls *ls, const struct dlm_rcom *rc);
 int dlm_recover_locks(struct dlm_ls *ls, uint64_t seq);
 void dlm_recovered_lock(struct dlm_rsb *r);
 int dlm_create_root_list(struct dlm_ls *ls);
diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index 8be2893ad15b..892d6ca21e74 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -30,7 +30,8 @@ struct rq_entry {
  * lockspace is enabled on some while still suspended on others.
  */
 
-void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms)
+void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid,
+			  const struct dlm_message *ms)
 {
 	struct rq_entry *e;
 	int length = le16_to_cpu(ms->m_header.h_length) -
diff --git a/fs/dlm/requestqueue.h b/fs/dlm/requestqueue.h
index 4e403469a845..42bfe23ceabe 100644
--- a/fs/dlm/requestqueue.h
+++ b/fs/dlm/requestqueue.h
@@ -11,7 +11,8 @@
 #ifndef __REQUESTQUEUE_DOT_H__
 #define __REQUESTQUEUE_DOT_H__
 
-void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms);
+void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid,
+			  const struct dlm_message *ms);
 int dlm_process_requestqueue(struct dlm_ls *ls);
 void dlm_wait_requestqueue(struct dlm_ls *ls);
 void dlm_purge_requestqueue(struct dlm_ls *ls);
-- 
2.31.1

