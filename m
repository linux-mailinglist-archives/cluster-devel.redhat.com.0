Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33D5383C3
	for <lists+cluster-devel@lfdr.de>; Mon, 30 May 2022 16:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653922546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/4cIFYQRtYPW25Cm2mggGMgMUOlgKOQTNO84djUlkNI=;
	b=UY3lqNFGUObwMyJsgTdhYZ1YMNrZB/2o8Z6oDahbXhrtTXEYSpQU907N767bwFmqSNXNgj
	9AjVTpYO6kBnJ7Yi7YTB4KJF1m3jIGPOHazvotZxXaddYyBuGTVpEZyQ/XAVzsUgoYdNxs
	xFFvAMEq7ZNY06Mc0onVhu+zOReGEdY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-nvfzQ776MqWUKwHonMI3Vg-1; Mon, 30 May 2022 10:55:44 -0400
X-MC-Unique: nvfzQ776MqWUKwHonMI3Vg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14C6729DD994;
	Mon, 30 May 2022 14:55:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B975492CA2;
	Mon, 30 May 2022 14:55:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DB3781947056;
	Mon, 30 May 2022 14:55:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4080F19466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 May 2022 14:55:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 228EB40EC006; Mon, 30 May 2022 14:55:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00DFB40EC002;
 Mon, 30 May 2022 14:55:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 May 2022 10:55:28 -0400
Message-Id: <20220530145528.1264681-3-aahringo@redhat.com>
In-Reply-To: <20220530145528.1264681-1-aahringo@redhat.com>
References: <20220530145528.1264681-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: add resource name to
 tracepoints
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds the resource name to dlm tracepoints. In case of
dlm_lock() we might end in a short time situation (if flags is not
convert) that a lkb is not associated with a resource at the time
when the tracepoint is called. Therefore we have a a prioritzation of
getting the resource name. If the resource in a lkb isn't set we use the
name and namelen passed as parameter as fallback.

The dlm resource name can be decoded as a string representated ascii
codec. DLM itself stores the name with as a null terminated array but
the user does not required to pass a null terminated resource name. To
have somehow a similar behaviour and the user knows that the resource
name of the dlm user is ascii codec we store the resource name array in
a null terminated array but pass the array length for the trace user
without the null terminated byte. The advantage here is that the user
can run directly a printf() on the resource name array with a optional
check on isascii().

The TP_printk() call however use always a hexadecimal string
representation for the resource name array.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c              |   4 +-
 include/trace/events/dlm.h | 134 ++++++++++++++++++++++++++++++++-----
 2 files changed, 118 insertions(+), 20 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 226822f49d30..e80d42ba64ae 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3472,7 +3472,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 	if (error)
 		goto out;
 
-	trace_dlm_lock_start(ls, lkb, mode, flags);
+	trace_dlm_lock_start(ls, lkb, name, namelen, mode, flags);
 
 	error = set_lock_args(mode, lksb, flags, namelen, 0, ast,
 			      astarg, bast, &args);
@@ -3487,7 +3487,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 	if (error == -EINPROGRESS)
 		error = 0;
  out_put:
-	trace_dlm_lock_end(ls, lkb, mode, flags, error);
+	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error);
 
 	if (convert || error)
 		__put_lkb(ls, lkb);
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index e333176ecfaf..180a24481929 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -49,38 +49,56 @@
 /* note: we begin tracing dlm_lock_start() only if ls and lkb are found */
 TRACE_EVENT(dlm_lock_start,
 
-	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, int mode,
-		 __u32 flags),
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, void *name,
+		 unsigned int namelen, int mode, __u32 flags),
 
-	TP_ARGS(ls, lkb, mode, flags),
+	TP_ARGS(ls, lkb, name, namelen, mode, flags),
 
 	TP_STRUCT__entry(
 		__field(__u32, ls_id)
 		__field(__u32, lkb_id)
 		__field(int, mode)
 		__field(__u32, flags)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length + 1 : namelen + 1)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+		char *c;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->mode = mode;
 		__entry->flags = flags;
+
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
+		else if (name)
+			memcpy(__get_dynamic_array(res_name), name,
+			       __get_dynamic_array_len(res_name));
+
+		c = __get_dynamic_array(res_name);
+		c[__get_dynamic_array_len(res_name) - 1] = '\0';
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s",
+	TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s res_name=%s",
 		  __entry->ls_id, __entry->lkb_id,
 		  show_lock_mode(__entry->mode),
-		  show_lock_flags(__entry->flags))
+		  show_lock_flags(__entry->flags),
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
 TRACE_EVENT(dlm_lock_end,
 
-	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, int mode, __u32 flags,
-		 int error),
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, void *name,
+		 unsigned int namelen, int mode, __u32 flags, int error),
 
-	TP_ARGS(ls, lkb, mode, flags, error),
+	TP_ARGS(ls, lkb, name, namelen, mode, flags, error),
 
 	TP_STRUCT__entry(
 		__field(__u32, ls_id)
@@ -88,14 +106,30 @@ TRACE_EVENT(dlm_lock_end,
 		__field(int, mode)
 		__field(__u32, flags)
 		__field(int, error)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length + 1 : namelen + 1)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+		char *c;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->mode = mode;
 		__entry->flags = flags;
 
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
+		else if (name)
+			memcpy(__get_dynamic_array(res_name), name,
+			       __get_dynamic_array_len(res_name));
+
+		c = __get_dynamic_array(res_name);
+		c[__get_dynamic_array_len(res_name) - 1] = '\0';
+
 		/* return value will be zeroed in those cases by dlm_lock()
 		 * we do it here again to not introduce more overhead if
 		 * trace isn't running and error reflects the return value.
@@ -104,12 +138,15 @@ TRACE_EVENT(dlm_lock_end,
 			__entry->error = 0;
 		else
 			__entry->error = error;
+
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s error=%d",
+	TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s error=%d res_name=%s",
 		  __entry->ls_id, __entry->lkb_id,
 		  show_lock_mode(__entry->mode),
-		  show_lock_flags(__entry->flags), __entry->error)
+		  show_lock_flags(__entry->flags), __entry->error,
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
@@ -123,16 +160,32 @@ TRACE_EVENT(dlm_bast,
 		__field(__u32, ls_id)
 		__field(__u32, lkb_id)
 		__field(int, mode)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length + 1 : 1)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+		char *c;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->mode = mode;
+
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
+
+		c = __get_dynamic_array(res_name);
+		c[__get_dynamic_array_len(res_name) - 1] = '\0';
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x mode=%s", __entry->ls_id,
-		  __entry->lkb_id, show_lock_mode(__entry->mode))
+	TP_printk("ls_id=%u lkb_id=%x mode=%s res_name=%s",
+		  __entry->ls_id, __entry->lkb_id,
+		  show_lock_mode(__entry->mode),
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
@@ -147,18 +200,33 @@ TRACE_EVENT(dlm_ast,
 		__field(__u32, lkb_id)
 		__field(u8, sb_flags)
 		__field(int, sb_status)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length + 1 : 1)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+		char *c;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->sb_flags = lkb->lkb_lksb->sb_flags;
 		__entry->sb_status = lkb->lkb_lksb->sb_status;
+
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
+
+		c = __get_dynamic_array(res_name);
+		c[__get_dynamic_array_len(res_name) - 1] = '\0';
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x sb_flags=%s sb_status=%d",
+	TP_printk("ls_id=%u lkb_id=%x sb_flags=%s sb_status=%d res_name=%s",
 		  __entry->ls_id, __entry->lkb_id,
-		  show_dlm_sb_flags(__entry->sb_flags), __entry->sb_status)
+		  show_dlm_sb_flags(__entry->sb_flags), __entry->sb_status,
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
@@ -173,17 +241,32 @@ TRACE_EVENT(dlm_unlock_start,
 		__field(__u32, ls_id)
 		__field(__u32, lkb_id)
 		__field(__u32, flags)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length + 1 : 1)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+		char *c;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->flags = flags;
+
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
+
+		c = __get_dynamic_array(res_name);
+		c[__get_dynamic_array_len(res_name) - 1] = '\0';
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x flags=%s",
+	TP_printk("ls_id=%u lkb_id=%x flags=%s res_name=%s",
 		  __entry->ls_id, __entry->lkb_id,
-		  show_lock_flags(__entry->flags))
+		  show_lock_flags(__entry->flags),
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
@@ -199,18 +282,33 @@ TRACE_EVENT(dlm_unlock_end,
 		__field(__u32, lkb_id)
 		__field(__u32, flags)
 		__field(int, error)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length + 1 : 1)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+		char *c;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->flags = flags;
 		__entry->error = error;
+
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
+
+		c = __get_dynamic_array(res_name);
+		c[__get_dynamic_array_len(res_name) - 1] = '\0';
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x flags=%s error=%d",
+	TP_printk("ls_id=%u lkb_id=%x flags=%s error=%d res_name=%s",
 		  __entry->ls_id, __entry->lkb_id,
-		  show_lock_flags(__entry->flags), __entry->error)
+		  show_lock_flags(__entry->flags), __entry->error,
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
-- 
2.31.1

