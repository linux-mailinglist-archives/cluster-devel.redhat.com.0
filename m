Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C9F2A292DE5
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NCjWJhNlGyc7eRVqFdQYuAot3NagWLCteTKNfG/vbk8=;
	b=h/fFpWrKXq/VHSPvR0FKim4hv8+HQA4NeF0eZGYL0SHG25l5eRXs87CuDFgfnVRRQwmg+g
	OCE+niJV2THzs5uK+I7DZyrCvb2huOeVsJ2rBKAb042cMBjwGkNvKN+p0abPbYLQSG0xkR
	UCW8pUuoPCy27koKsOsXFcvoKXKTF1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-HP5lbK1OPs2ztaCKRly44w-1; Mon, 19 Oct 2020 14:59:33 -0400
X-MC-Unique: HP5lbK1OPs2ztaCKRly44w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43ED28049CA;
	Mon, 19 Oct 2020 18:59:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30CB327CCC;
	Mon, 19 Oct 2020 18:59:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15E5D181A06D;
	Mon, 19 Oct 2020 18:59:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxROP021261 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 591985C22B; Mon, 19 Oct 2020 18:59:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C34465C1A3;
	Mon, 19 Oct 2020 18:59:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:09 -0400
Message-Id: <20201019185916.707827-3-aahringo@redhat.com>
In-Reply-To: <20201019185916.707827-1-aahringo@redhat.com>
References: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/9] fs: dlm: define max send buffer
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will set the maximum transmit buffer size for rcom messages
with "names" to PAGE_SIZE. It's a leftover change of
commit 4798cbbfbd00 ("fs: dlm: rework receive handling"). Fact is that we
cannot allocate a contiguous transmit buffer length above of a PAGE_SIZE.
It seems at some places the upper layer protocol will calculate according
to dlm_config.ci_buffer_size the possible payload of a dlm recovery
message. As compiler setting we will use now the maximum possible
message which dlm can send out. Commit 4e192ee68e5af ("fs: dlm: disallow
buffer size below default") disallow a buffer setting smaller than the
PAGE_SIZE and above PAGE_SIZE is definitely wrong because we will then
write out of buffer space as we cannot allocate a contiguous buffer above
PAGE_SIZE. The ci_buffer_size is still there to define the possible
maximum receive buffer size of a recvmsg() which should be at least the
maximum possible dlm message size.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c | 2 +-
 fs/dlm/lowcomms.h  | 4 ++++
 fs/dlm/member.c    | 2 +-
 fs/dlm/rcom.c      | 6 +++---
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 624617c12250a..561dcad08ad6e 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -572,7 +572,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	mutex_init(&ls->ls_requestqueue_mutex);
 	mutex_init(&ls->ls_clear_proc_locks);
 
-	ls->ls_recover_buf = kmalloc(dlm_config.ci_buffer_size, GFP_NOFS);
+	ls->ls_recover_buf = kmalloc(LOWCOMMS_MAX_TX_BUFFER_LEN, GFP_NOFS);
 	if (!ls->ls_recover_buf)
 		goto out_lkbidr;
 
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 687b2894e469a..f68d361b6e8c7 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -12,6 +12,10 @@
 #ifndef __LOWCOMMS_DOT_H__
 #define __LOWCOMMS_DOT_H__
 
+#include <asm/page.h>
+
+#define LOWCOMMS_MAX_TX_BUFFER_LEN	PAGE_SIZE
+
 int dlm_lowcomms_start(void);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 7ad83deb45053..ceef3f2074ffd 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -270,7 +270,7 @@ int dlm_slots_assign(struct dlm_ls *ls, int *num_slots, int *slots_size,
 
 	log_slots(ls, gen, num, NULL, array, array_size);
 
-	max_slots = (dlm_config.ci_buffer_size - sizeof(struct dlm_rcom) -
+	max_slots = (LOWCOMMS_MAX_TX_BUFFER_LEN - sizeof(struct dlm_rcom) -
 		     sizeof(struct rcom_config)) / sizeof(struct rcom_slot);
 
 	if (num > max_slots) {
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 4daf5dc2b51c0..73ddee5159d79 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -162,7 +162,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	set_rcom_status(ls, (struct rcom_status *)rc->rc_buf, status_flags);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, dlm_config.ci_buffer_size);
+	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
 	send_rcom(ls, mh, rc);
 
@@ -284,7 +284,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	memcpy(rc->rc_buf, last_name, last_len);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, dlm_config.ci_buffer_size);
+	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
 
 	send_rcom(ls, mh, rc);
 
@@ -304,7 +304,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
 	nodeid = rc_in->rc_header.h_nodeid;
 	inlen = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
-	outlen = dlm_config.ci_buffer_size - sizeof(struct dlm_rcom);
+	outlen = LOWCOMMS_MAX_TX_BUFFER_LEN - sizeof(struct dlm_rcom);
 
 	error = create_rcom(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen, &rc, &mh);
 	if (error)
-- 
2.26.2

