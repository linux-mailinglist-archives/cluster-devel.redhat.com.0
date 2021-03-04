Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 599ED32D673
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Mar 2021 16:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614871397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aYTbMDYctzXTP1lGI/qs74mYbcaSxVhdB7MYXTA57UA=;
	b=GP178nqTiVYr/J5O4bC50KrEF2NOwHMDG9JMS/HBjMntu01CzGxKyqJhpjAcpJqbTdZJcT
	QrdDw7XTTE9ODPMhygmakIxJUuLQlQDf64XnzXuU0qokw5TWlhJSUfncuI7Vh35CkAt4LD
	4R7nDSqrrPA9iglGmdS+KbmXq9t/+Yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-RbljSLQiMjKaM8kpOdj3dA-1; Thu, 04 Mar 2021 10:23:16 -0500
X-MC-Unique: RbljSLQiMjKaM8kpOdj3dA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 830A719057A7;
	Thu,  4 Mar 2021 15:23:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 961C85D762;
	Thu,  4 Mar 2021 15:23:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C99C61809C86;
	Thu,  4 Mar 2021 15:23:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 124FN59r014855 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Mar 2021 10:23:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E937010023B2; Thu,  4 Mar 2021 15:23:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFFCA10016DB;
	Thu,  4 Mar 2021 15:23:02 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C52FB18095CA;
	Thu,  4 Mar 2021 15:23:01 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:22:59 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Message-ID: <669736422.59715790.1614871379550.JavaMail.zimbra@redhat.com>
In-Reply-To: <1614850640-63803-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1614850640-63803-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.225, 10.4.195.13]
Thread-Topic: gfs2: make function gfs2_make_fs_ro() to void type
Thread-Index: tP8ZFycLfqsXQRyPZDKwsUS7L7wEUg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: make function gfs2_make_fs_ro()
	to void type
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> It fixes the following warning detected by coccinelle:
> ./fs/gfs2/super.c:592:5-10: Unneeded variable: "error". Return "0" on
> line 628
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/gfs2/ops_fstype.c | 4 +---
>  fs/gfs2/super.c      | 9 +++------
>  fs/gfs2/super.h      | 2 +-
>  fs/gfs2/util.c       | 2 +-
>  4 files changed, 6 insertions(+), 11 deletions(-)

Thanks. Your patch is now pushed to linux-gfs2/for-next.
I did one minor cleanup: Function gfs2_put_super in super.c no longer
needed the variable "error" so I removed it to avoid warnings.

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/fs/gfs2?h=for-next&id=0e787a0bfabb8be323f575d5cdda48e607840eb5

Regards,

Bob Peterson

