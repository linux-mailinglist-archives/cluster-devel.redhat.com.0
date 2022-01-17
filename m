Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E9F490B8D
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Jan 2022 16:39:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642433971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DAdH4EOQ/AE/OVtTRiSy0pkij6an5n7STjziVUZ/9Io=;
	b=VfKprvJNVP1zqHGtziXc7YJAW5zuTXOpSn0rxKX7clEVN/EHE1iWEexJLek9DmcBagwddW
	zD1ZmI6ORJ9eoPMTLfxWmmOvJzgsU3IQhc0Xdkd3xbRr8/zFz7BYitDFTnFgUKrDbX/meX
	l1RzWNHY/9KyphvST/iOToP/bncoKpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-UhRoQmcgOpKWMuX6ONuyfg-1; Mon, 17 Jan 2022 10:39:21 -0500
X-MC-Unique: UhRoQmcgOpKWMuX6ONuyfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53F0B106BB25;
	Mon, 17 Jan 2022 15:39:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB2EF5B931;
	Mon, 17 Jan 2022 15:39:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F9E94BB7C;
	Mon, 17 Jan 2022 15:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20HFcmje000406 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 10:38:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6579D10A48AC; Mon, 17 Jan 2022 15:38:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 459D910A48A8;
	Mon, 17 Jan 2022 15:38:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 17 Jan 2022 10:38:39 -0500
Message-Id: <20220117153839.2654806-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: add lkb attach resource
	trace
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a tracpoint for dlm_attach() which indicates the local
lkb is attached to a global resource. This becomes useful to make a
connection between a local ls_id and lkb_id (from e.g. dlm_lock_start
tracepoint) to a global lock reference which is the same cluster-wide.

The trace printk will look like the following output:

ls_id=3841231384, lkb_id=23, res_name=202020202020203520202020202020202020343531356462, res_length=24

Most time the resource name using ASCII codec which allows us to print it
out. However this is not required. The printout used here will represent
the resource name as a bytewise hexademical string.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c              |  1 +
 include/trace/events/dlm.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index bdb51d209ba2..f6ad96de4f3b 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1169,6 +1169,7 @@ static void kill_rsb(struct kref *kref)
 static void attach_lkb(struct dlm_rsb *r, struct dlm_lkb *lkb)
 {
 	hold_rsb(r);
+	trace_dlm_attach_lkb(lkb, r);
 	lkb->lkb_resource = r;
 }
 
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 32088c603244..53b81faa5877 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -214,6 +214,34 @@ TRACE_EVENT(dlm_unlock_end,
 
 );
 
+TRACE_EVENT(dlm_attach_lkb,
+
+	TP_PROTO(const struct dlm_lkb *lkb, const struct dlm_rsb *r),
+
+	TP_ARGS(lkb, r),
+
+	TP_STRUCT__entry(
+		__field(__u32, ls_id)
+		__field(__u32, lkb_id)
+		__field(int, res_length)
+		__dynamic_array(unsigned char, res_name, r->res_length)
+	),
+
+	TP_fast_assign(
+		__entry->ls_id = r->res_ls->ls_global_id;
+		__entry->lkb_id = lkb->lkb_id;
+		__entry->res_length = r->res_length;
+		memcpy(__get_dynamic_array(res_name), r->res_name,
+		       __get_dynamic_array_len(res_name));
+	),
+
+	TP_printk("ls_id=%u, lkb_id=%x, res_name=%s, res_length=%d",
+		  __entry->ls_id, __entry->lkb_id,
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)),
+		  __entry->res_length)
+);
+
 TRACE_EVENT(dlm_send,
 
 	TP_PROTO(int nodeid, int ret),
-- 
2.31.1

