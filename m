Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B017610311
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G2yUFEU0jRgaKbNuFpbO0JR9kr2ijAKjsK1uF5QuLNw=;
	b=J19Rt86kqbsjh3n7hT5Z0XjwXUgrxI/uYUDnrDNRKtfP0Vg02YvtWrhDG2OU7BznTYz6tw
	k9P51uy9cR7r3nbG9dzXMbQ3gbqRCGNczkvo+pNFMDjffsY8nzWih8KmWFakNEPrzJ2H8P
	Qzj0dfU0b3CHoDPBLcYDwcWrreTAyLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-wvp0hf0ONyOFc5gDJ812Wg-1; Thu, 27 Oct 2022 16:45:59 -0400
X-MC-Unique: wvp0hf0ONyOFc5gDJ812Wg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FDDA857D15;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 288F74EA52;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0665C1947068;
	Thu, 27 Oct 2022 20:45:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FC3619466DF for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA1C9112C06E; Thu, 27 Oct 2022 20:45:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B57EC1121325;
 Thu, 27 Oct 2022 20:45:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:13 -0400
Message-Id: <20221027204528.1119036-3-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 03/18] fs: dlm: remove send repeat
 remove handling
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes the send repeat remove handling. This handling is
there to repeatingly DLM_MSG_REMOVE messages in cases the dlm stack
thinks it was not received at the first time. In cases of message drops
this functionality is necessary, but since the DLM midcomms layer
guarantees there are no messages drops between cluster nodes this
feature became not strict necessary anymore. Due message
delays/processing it could be that two send_repeat_remove() are sent out
while the other should be still on it's way. We remove the repeat remove
handling because we are sure that the message cannot be dropped due
communication errors.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 74 ---------------------------------------------------
 1 file changed, 74 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 94a72ede5764..b246d71b5e17 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -4044,66 +4044,6 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	return error;
 }
 
-static void send_repeat_remove(struct dlm_ls *ls, char *ms_name, int len)
-{
-	char name[DLM_RESNAME_MAXLEN + 1];
-	struct dlm_message *ms;
-	struct dlm_mhandle *mh;
-	struct dlm_rsb *r;
-	uint32_t hash, b;
-	int rv, dir_nodeid;
-
-	memset(name, 0, sizeof(name));
-	memcpy(name, ms_name, len);
-
-	hash = jhash(name, len, 0);
-	b = hash & (ls->ls_rsbtbl_size - 1);
-
-	dir_nodeid = dlm_hash2nodeid(ls, hash);
-
-	log_error(ls, "send_repeat_remove dir %d %s", dir_nodeid, name);
-
-	spin_lock(&ls->ls_rsbtbl[b].lock);
-	rv = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].keep, name, len, &r);
-	if (!rv) {
-		spin_unlock(&ls->ls_rsbtbl[b].lock);
-		log_error(ls, "repeat_remove on keep %s", name);
-		return;
-	}
-
-	rv = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].toss, name, len, &r);
-	if (!rv) {
-		spin_unlock(&ls->ls_rsbtbl[b].lock);
-		log_error(ls, "repeat_remove on toss %s", name);
-		return;
-	}
-
-	/* use ls->remove_name2 to avoid conflict with shrink? */
-
-	spin_lock(&ls->ls_remove_spin);
-	ls->ls_remove_len = len;
-	memcpy(ls->ls_remove_name, name, DLM_RESNAME_MAXLEN);
-	spin_unlock(&ls->ls_remove_spin);
-	spin_unlock(&ls->ls_rsbtbl[b].lock);
-
-	rv = _create_message(ls, sizeof(struct dlm_message) + len,
-			     dir_nodeid, DLM_MSG_REMOVE, &ms, &mh);
-	if (rv)
-		goto out;
-
-	memcpy(ms->m_extra, name, len);
-	ms->m_hash = cpu_to_le32(hash);
-
-	send_message(mh, ms);
-
-out:
-	spin_lock(&ls->ls_remove_spin);
-	ls->ls_remove_len = 0;
-	memset(ls->ls_remove_name, 0, DLM_RESNAME_MAXLEN);
-	spin_unlock(&ls->ls_remove_spin);
-	wake_up(&ls->ls_remove_wait);
-}
-
 static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb;
@@ -4173,25 +4113,11 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 	   ENOTBLK request failures when the lookup reply designating us
 	   as master is delayed. */
 
-	/* We could repeatedly return -EBADR here if our send_remove() is
-	   delayed in being sent/arriving/being processed on the dir node.
-	   Another node would repeatedly lookup up the master, and the dir
-	   node would continue returning our nodeid until our send_remove
-	   took effect.
-
-	   We send another remove message in case our previous send_remove
-	   was lost/ignored/missed somehow. */
-
 	if (error != -ENOTBLK) {
 		log_limit(ls, "receive_request %x from %d %d",
 			  le32_to_cpu(ms->m_lkid), from_nodeid, error);
 	}
 
-	if (namelen && error == -EBADR) {
-		send_repeat_remove(ls, ms->m_extra, namelen);
-		msleep(1000);
-	}
-
 	setup_stub_lkb(ls, ms);
 	send_request_reply(&ls->ls_stub_rsb, &ls->ls_stub_lkb, error);
 	return error;
-- 
2.31.1

