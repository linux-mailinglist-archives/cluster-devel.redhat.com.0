Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE64B951A
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 01:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645058522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pak+Xdzwc+JsK8jwZZctq9SlhKCRD3EnSGtEY3VpjCA=;
	b=GetSW03jGTMtbFzcAGk5R1ASz1NYNFzK4epr9eSM7w7AITurhT8EBRj/uE7N7gzaQgUfEx
	PKJGbl/DLyIPU2SU+UvmGmmehE3RQISMgCMYAbaIDl2N6UUo2ytLxib21wioz/9hsaQJmi
	pu00mq+DBDL6Q1ZkkHIfKc/uW+SXf7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-smP1xLKwNduJRcQ6L113nw-1; Wed, 16 Feb 2022 19:41:59 -0500
X-MC-Unique: smP1xLKwNduJRcQ6L113nw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B0611853022;
	Thu, 17 Feb 2022 00:41:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CA7B105C739;
	Thu, 17 Feb 2022 00:41:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 766C54BB7B;
	Thu, 17 Feb 2022 00:41:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21H0frl0008545 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 19:41:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0565795B7; Thu, 17 Feb 2022 00:41:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B45687A224;
	Thu, 17 Feb 2022 00:41:43 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Alexander Aring <aahringo@redhat.com>
Date: Thu, 17 Feb 2022 01:41:42 +0100
Message-Id: <20220217004142.551299-1-agruenba@redhat.com>
In-Reply-To: <CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
References: <CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
	<20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/4] fs: dlm: replace sanity
	checks with WARN_ON
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

There's also an unnecessary INIT_LIST_HEAD() in send_op().

Andreas

---
 fs/dlm/plock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index ce1af7986e16..ff439d780cb1 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -67,7 +67,6 @@ static void dlm_release_plock_op(struct plock_op *op)
 static void send_op(struct plock_op *op)
 {
 	set_version(&op->info);
-	INIT_LIST_HEAD(&op->list);
 	spin_lock(&ops_lock);
 	list_add_tail(&op->list, &send_list);
 	spin_unlock(&ops_lock);
-- 
2.33.1

