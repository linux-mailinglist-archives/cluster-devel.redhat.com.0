Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D67552F1D68
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:04:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+HFogX90agCKUQr+0zWWoQGrVon1/45ftbbTVr9/Ny0=;
	b=LrqdPiuUdDnUVmaIdhMW5l6pF6leMmSCfWYrOir3E3Oguh970Ql6tK90nZmkJBU1PzHaiM
	KoYuJndX+g1Pt6SFhkG2zDN9VsdcrfPL9M1BdPAB6RSBNNrUgnUse+pM2jnA0aQi1cD0JK
	+IgUbxm+Hx29uZAHu+qkIbWnynxJtx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-Nf9f0MfHN1OBIu8b4xZ7jw-1; Mon, 11 Jan 2021 13:03:59 -0500
X-MC-Unique: Nf9f0MfHN1OBIu8b4xZ7jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46499CC625;
	Mon, 11 Jan 2021 18:03:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 376AE6EF5A;
	Mon, 11 Jan 2021 18:03:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 207135002C;
	Mon, 11 Jan 2021 18:03:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3uNo032466 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5BA975D9FC; Mon, 11 Jan 2021 18:03:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6D985D9DB;
	Mon, 11 Jan 2021 18:03:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:03:10 -0500
Message-Id: <20210111180310.122451-21-aahringo@redhat.com>
In-Reply-To: <20210111180310.122451-1-aahringo@redhat.com>
References: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 20/20] fs: dlm: check for invalid
	namelen
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds an additional check inside the dlm locking from user space
functionality that the namelen isn't above the maximum allowed dlm
resource name length. If the namelen is above the maximum allowed we
have a invalid state and out of buffer access can occur. Cut off the
namelen attribute to maximum size is not an option because we might run
into name conflicts and the user should be get aware of that.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/user.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index e5cefa90b1ce..9f2f743eeb31 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -241,6 +241,9 @@ static int device_user_lock(struct dlm_user_proc *proc,
 	uint32_t lkid;
 	int error = -ENOMEM;
 
+	if (params->namelen > DLM_RESNAME_MAXLEN)
+		return -EINVAL;
+
 	ls = dlm_find_lockspace_local(proc->lockspace);
 	if (!ls)
 		return -ENOENT;
-- 
2.26.2

