Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E80C8792403
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Sep 2023 17:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693928465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UfnqfUWRcD9m8WUR5GiBpJG8YD4Cbc0Ive2hmh9ofaQ=;
	b=dSDc6ghPiS0rbMG49oPtXvUwTfpDsz7jGDWZhU62unCRHDbJCbRSwgnMir17e7rzRZyTwS
	ivcKu1WCnPeRUIeaPyRxK30+H6Un+3+eG+skSc6a572O4CjcWz64ZwtB5iQYoDtGz2rqo6
	h2MCippFx1vBbuMMYlnTdlNCrreVxDw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-zQ5ZM3TkM0m9EmWWFH5Qpw-1; Tue, 05 Sep 2023 11:41:02 -0400
X-MC-Unique: zQ5ZM3TkM0m9EmWWFH5Qpw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93AD23C1C994;
	Tue,  5 Sep 2023 15:41:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A56A46F524;
	Tue,  5 Sep 2023 15:41:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E75871946597;
	Tue,  5 Sep 2023 15:41:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 191301946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Sep 2023 15:41:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E3C1F140E968; Tue,  5 Sep 2023 15:40:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DBB8140E962;
 Tue,  5 Sep 2023 15:40:59 +0000 (UTC)
Date: Tue, 5 Sep 2023 10:40:56 -0500
From: David Teigland <teigland@redhat.com>
To: Andrew Price <anprice@redhat.com>
Message-ID: <20230905154056.GA20620@redhat.com>
References: <20230831095749.9616-1-anprice@redhat.com>
 <20230831095749.9616-2-anprice@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230831095749.9616-2-anprice@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 2/2] MAINTAINERS: Update dlm mailing list
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 31, 2023 at 10:57:49AM +0100, Andrew Price wrote:
> The new gfs2@ list will also be used for dlm development.
> 
> Signed-off-by: Andrew Price <anprice@redhat.com>

Ack, thanks.

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index caae31fb9741..946fcf6c8d77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6093,7 +6093,7 @@ F:	include/video/udlfb.h
>  DISTRIBUTED LOCK MANAGER (DLM)
>  M:	Christine Caulfield <ccaulfie@redhat.com>
>  M:	David Teigland <teigland@redhat.com>
> -L:	cluster-devel@redhat.com
> +L:	gfs2@lists.linux.dev
>  S:	Supported
>  W:	http://sources.redhat.com/cluster/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git
> -- 
> 2.41.0

