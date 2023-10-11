Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E769B7C4ACF
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 08:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697006461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EWp7SerSUb2+X2DjybD4/wiaG3R9wiKMNAVXWo/ky40=;
	b=Ktyn2ry2sNXN/Rc45ujm5sGh6+Ld297Uwp/v3NMyZY0XuPlU6Sls3zdhYpx8aLcBaDvOgA
	VwqtPZPTDEy2w/XmD4NpTB0fDUOYN0GE066XQXCp7Hftn0AYQ9A+7zQAUbg99L8DYER8wZ
	reP+XYkJpqSz277t7PXBZRYuEKNNN44=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-ZiUk7mQcNCKpCFHLDBQYIA-1; Wed, 11 Oct 2023 02:40:59 -0400
X-MC-Unique: ZiUk7mQcNCKpCFHLDBQYIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7640F8007A4;
	Wed, 11 Oct 2023 06:40:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1465863F55;
	Wed, 11 Oct 2023 06:40:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 31BF219466EC;
	Wed, 11 Oct 2023 06:40:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6C9461946597 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5434C492B00; Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6EB492C3E
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 299811C09A4D
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-Dw1HlhvFPjqccHgxWNYnRA-1; Wed,
 11 Oct 2023 02:33:22 -0400
X-MC-Unique: Dw1HlhvFPjqccHgxWNYnRA-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 82041B81F6B;
 Wed, 11 Oct 2023 06:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6664EC433C7;
 Wed, 11 Oct 2023 06:25:18 +0000 (UTC)
Date: Wed, 11 Oct 2023 08:25:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <2023101138-rickety-collector-e9fc@gregkh>
References: <20231010220448.2978176-1-aahringo@redhat.com>
 <20231010220448.2978176-4-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231010220448.2978176-4-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH RESEND 4/8] dlm: fix creating multiple
 node structures
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 10, 2023 at 06:04:44PM -0400, Alexander Aring wrote:
> This patch will lookup existing nodes instead of always creating them
> when dlm_midcomms_addr() is called. The idea is here to create midcomms
> nodes when user space getting informed that nodes joins the cluster. This
> is the case when dlm_midcomms_addr() is called, however it can be called
> multiple times by user space to add several address configurations to one
> node e.g. when using SCTP. Those multiple times need to be filtered out
> and we doing that by looking up if the node exists before. Due configfs
> entry it is safe that this function gets only called once at a time.
> 
> Cc: stable@vger.kernel.org
> Fixes: 63e711b08160 ("fs: dlm: create midcomms nodes when configure")
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/midcomms.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Why does patch 4/8 have a cc: stable, when it depends on patches 1-3 as
well?  That is going to drive us crazy when it hits Linus's tree, how do
we know the dependancies here anymore?

thanks,

greg k-h

