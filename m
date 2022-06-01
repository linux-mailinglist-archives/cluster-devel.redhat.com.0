Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C71253AEB9
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Jun 2022 00:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654123506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pEwVAzLIycJVqcl8wbNKrtKTc7ST1gHZjf2X04L0RDA=;
	b=ChnANPEZEYD+Bd/pQ2vln8fJ4RB0Uy0Mg5sgMG1SnDUkCotf6hXjCe9TZvFFGVTOBML6n7
	A7khh48RTU7KxEL9l1RYugyyOK9FVo+VkCjqRqZ0bpZquDVFSZ0TnYVx6rnsF6KO5jvJtZ
	mN5wzNQen2KZWJfpujOn4swpj77R5uk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-7NJ62o5CMqWFjn1HWn4mWQ-1; Wed, 01 Jun 2022 18:45:03 -0400
X-MC-Unique: 7NJ62o5CMqWFjn1HWn4mWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 050BF3C0CD55;
	Wed,  1 Jun 2022 22:45:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31ACD1410F37;
	Wed,  1 Jun 2022 22:45:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D23611947B8C;
	Wed,  1 Jun 2022 22:45:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 333C6194707F for <cluster-devel@listman.corp.redhat.com>;
 Wed,  1 Jun 2022 22:44:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1251582886; Wed,  1 Jun 2022 22:44:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E87401731B;
 Wed,  1 Jun 2022 22:44:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  1 Jun 2022 18:44:54 -0400
Message-Id: <20220601224454.1640688-4-aahringo@redhat.com>
In-Reply-To: <20220601224454.1640688-1-aahringo@redhat.com>
References: <20220601224454.1640688-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCHv2 dlm/next 3/3] fs: dlm: add resource name
 to tracepoints
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

It should be okay to access the lkb_resource and the res_name field at
the time when the tracepoint is invoked. The resource is assigned to a
lkb and it's reference is being hold during the tracepoint call. During
this time the resource cannot be freed. Also a lkb will never switch
it's assigned resource. The name of a dlm_rsb is assigned at creation
time and should never be changed during runtime as well.

Sometimes the resource name e.g. gfs2 is ascii encoded but this isn't
required by DLM itself. If it's ascii encoded please note that the
resource name is not null-terminated.

The TP_printk() call uses always a hexadecimal string array
representation for the resource name.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c              |   4 +-
 include/trace/events/dlm.h | 110 +++++++++++++++++++++++++++++++------
 2 files changed, 94 insertions(+), 20 deletions(-)

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
index e333176ecfaf..bad21222130e 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -49,38 +49,52 @@
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
+				lkb->lkb_resource ? lkb->lkb_resource->res_length : namelen)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
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
@@ -88,14 +102,26 @@ TRACE_EVENT(dlm_lock_end,
 		__field(int, mode)
 		__field(__u32, flags)
 		__field(int, error)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length : namelen)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
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
 		/* return value will be zeroed in those cases by dlm_lock()
 		 * we do it here again to not introduce more overhead if
 		 * trace isn't running and error reflects the return value.
@@ -104,12 +130,15 @@ TRACE_EVENT(dlm_lock_end,
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
 
@@ -123,16 +152,28 @@ TRACE_EVENT(dlm_bast,
 		__field(__u32, ls_id)
 		__field(__u32, lkb_id)
 		__field(int, mode)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length : 0)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->mode = mode;
+
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x mode=%s", __entry->ls_id,
-		  __entry->lkb_id, show_lock_mode(__entry->mode))
+	TP_printk("ls_id=%u lkb_id=%x mode=%s res_name=%s",
+		  __entry->ls_id, __entry->lkb_id,
+		  show_lock_mode(__entry->mode),
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
@@ -147,18 +188,29 @@ TRACE_EVENT(dlm_ast,
 		__field(__u32, lkb_id)
 		__field(u8, sb_flags)
 		__field(int, sb_status)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length : 0)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
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
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x sb_flags=%s sb_status=%d",
+	TP_printk("ls_id=%u lkb_id=%x sb_flags=%s sb_status=%d res_name=%s",
 		  __entry->ls_id, __entry->lkb_id,
-		  show_dlm_sb_flags(__entry->sb_flags), __entry->sb_status)
+		  show_dlm_sb_flags(__entry->sb_flags), __entry->sb_status,
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
@@ -173,17 +225,28 @@ TRACE_EVENT(dlm_unlock_start,
 		__field(__u32, ls_id)
 		__field(__u32, lkb_id)
 		__field(__u32, flags)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length : 0)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
+
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->flags = flags;
+
+		r = lkb->lkb_resource;
+		if (r)
+			memcpy(__get_dynamic_array(res_name), r->res_name,
+			       __get_dynamic_array_len(res_name));
 	),
 
-	TP_printk("ls_id=%u lkb_id=%x flags=%s",
+	TP_printk("ls_id=%u lkb_id=%x flags=%s res_name=%s",
 		  __entry->ls_id, __entry->lkb_id,
-		  show_lock_flags(__entry->flags))
+		  show_lock_flags(__entry->flags),
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
 
 );
 
@@ -199,18 +262,29 @@ TRACE_EVENT(dlm_unlock_end,
 		__field(__u32, lkb_id)
 		__field(__u32, flags)
 		__field(int, error)
+		__dynamic_array(unsigned char, res_name,
+				lkb->lkb_resource ? lkb->lkb_resource->res_length : 0)
 	),
 
 	TP_fast_assign(
+		struct dlm_rsb *r;
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

