Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8797C3CBDBA
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466993;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9W20vA+T0l0GTNG+b+k4rq2PPBfJ6OeOcokUiCd7bKk=;
	b=gENMHs5DZIcCoHp+T168574O3VVecVQQaurVTRwOOgxXzQ4+V04rCgSWPcgsHwt8EcbxhE
	kc/r12aLgkRh6kkAP0kEowuTmNU2um611adT3KFnYjqPRgQgQpU2ZM2tokBwZahdVKHsNX
	d3ojRnnPWieIgvM2VfOrWJ+TVV+knYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166--S8M7-i5My6HslkLEqJU6Q-1; Fri, 16 Jul 2021 16:23:08 -0400
X-MC-Unique: -S8M7-i5My6HslkLEqJU6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC6E100CCD8;
	Fri, 16 Jul 2021 20:23:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1ACD5D9C6;
	Fri, 16 Jul 2021 20:23:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB1921809C99;
	Fri, 16 Jul 2021 20:23:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKN4HV026074 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:23:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 82BDC5D6D5; Fri, 16 Jul 2021 20:23:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D4B75D6AB;
	Fri, 16 Jul 2021 20:23:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:38 -0400
Message-Id: <20210716202245.1262791-6-aahringo@redhat.com>
In-Reply-To: <20210716202245.1262791-1-aahringo@redhat.com>
References: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 05/12] fs: dlm: cleanup and remove
	_send_rcom
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The _send_rcom() can be removed and we call directly dlm_rcom_out().
As we doing that we removing the struct dlm_ls parameter which isn't
used.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/rcom.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 5651933f54a4..6cba86470278 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -89,22 +89,15 @@ static int create_rcom_stateless(struct dlm_ls *ls, int to_nodeid, int type,
 	return 0;
 }
 
-static void _send_rcom(struct dlm_ls *ls, struct dlm_rcom *rc)
+static void send_rcom(struct dlm_mhandle *mh, struct dlm_rcom *rc)
 {
 	dlm_rcom_out(rc);
-}
-
-static void send_rcom(struct dlm_ls *ls, struct dlm_mhandle *mh,
-		      struct dlm_rcom *rc)
-{
-	_send_rcom(ls, rc);
 	dlm_midcomms_commit_mhandle(mh);
 }
 
-static void send_rcom_stateless(struct dlm_ls *ls, struct dlm_msg *msg,
-				struct dlm_rcom *rc)
+static void send_rcom_stateless(struct dlm_msg *msg, struct dlm_rcom *rc)
 {
-	_send_rcom(ls, rc);
+	dlm_rcom_out(rc);
 	dlm_lowcomms_commit_msg(msg);
 	dlm_lowcomms_put_msg(msg);
 }
@@ -204,7 +197,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, DLM_MAX_SOCKET_BUFSIZE);
 
-	send_rcom_stateless(ls, msg, rc);
+	send_rcom_stateless(msg, rc);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -287,7 +280,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	spin_unlock(&ls->ls_recover_lock);
 
  do_send:
-	send_rcom_stateless(ls, msg, rc);
+	send_rcom_stateless(msg, rc);
 }
 
 static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
@@ -327,7 +320,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	allow_sync_reply(ls, &rc->rc_id);
 	memset(ls->ls_recover_buf, 0, DLM_MAX_SOCKET_BUFSIZE);
 
-	send_rcom_stateless(ls, msg, rc);
+	send_rcom_stateless(msg, rc);
 
 	error = dlm_wait_function(ls, &rcom_response);
 	disallow_sync_reply(ls);
@@ -356,7 +349,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
 	dlm_copy_master_names(ls, rc_in->rc_buf, inlen, rc->rc_buf, outlen,
 			      nodeid);
-	send_rcom_stateless(ls, msg, rc);
+	send_rcom_stateless(msg, rc);
 }
 
 int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
@@ -373,7 +366,7 @@ int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
 	memcpy(rc->rc_buf, r->res_name, r->res_length);
 	rc->rc_id = (unsigned long) r->res_id;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(mh, rc);
  out:
 	return error;
 }
@@ -404,7 +397,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(mh, rc);
 }
 
 static void receive_rcom_lookup_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
@@ -461,7 +454,7 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	pack_rcom_lock(r, lkb, rl);
 	rc->rc_id = (unsigned long) r;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(mh, rc);
  out:
 	return error;
 }
@@ -487,7 +480,7 @@ static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
 
-	send_rcom(ls, mh, rc);
+	send_rcom(mh, rc);
 }
 
 /* If the lockspace doesn't exist then still send a status message
-- 
2.27.0

