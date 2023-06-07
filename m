Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE5725616
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jun 2023 09:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686123743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WS54fpJe8yryLR4gvNe7ucyDiUogTeWQhxlab81BILA=;
	b=fFj2JhGCjIboH2oPpITJOWmLjBGyNftYl8gVb6jS1435FN++fbVJj5F31bG59ZORm6c8MX
	tc7fgaW0IJqOYz7bGBu8NJF8A5QI5NM8azuWRxI255XGwcCFBnYXBlqRbF6F3kb5NikgsH
	FNmyh+l1OazgDgCvfkTP/0hpSy9vKnI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-NOgzU7tqPUGBEFeIZUtZeg-1; Wed, 07 Jun 2023 03:42:19 -0400
X-MC-Unique: NOgzU7tqPUGBEFeIZUtZeg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A32411C06923;
	Wed,  7 Jun 2023 07:42:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C579492B00;
	Wed,  7 Jun 2023 07:42:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C33C419452C6;
	Wed,  7 Jun 2023 07:42:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 35F5419465BA for <cluster-devel@listman.corp.redhat.com>;
 Wed,  7 Jun 2023 07:42:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7F24C40218C; Wed,  7 Jun 2023 07:42:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76B0148205E
 for <cluster-devel@redhat.com>; Wed,  7 Jun 2023 07:42:02 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C09E811E7F
 for <cluster-devel@redhat.com>; Wed,  7 Jun 2023 07:42:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-7c6R2HfkPaCLNRw_Eyf8qQ-1; Wed, 07 Jun 2023 03:42:00 -0400
X-MC-Unique: 7c6R2HfkPaCLNRw_Eyf8qQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAE9763BA2;
 Wed,  7 Jun 2023 07:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9182C43445;
 Wed,  7 Jun 2023 07:35:54 +0000 (UTC)
Date: Wed, 7 Jun 2023 09:35:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <2023060744-raft-gizzard-ad1d@gregkh>
References: <20230606215626.327239-1-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230606215626.327239-1-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix nfs async lock
 callback handling
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 06, 2023 at 05:56:26PM -0400, Alexander Aring wrote:
> This patch is fixing the current the callback handling if it's a nfs
> async lock request signaled if fl_lmops is set.
> 
> When using `stress-ng --fcntl 32` on the kernel log there are several
> messages like:
> 
> [11185.123533] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 000000007d13afae
> [11185.127135] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 00000000a6046fa0
> [11185.142668] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 000000001d13dfa5
> 
> The commit 40595cdc93ed ("nfs: block notification on fs with its
> own ->lock") using only trylocks in an asynchronous polling behaviour. The
> behaviour before was however differently by evaluating F_SETLKW or F_SETLK
> and evaluating FL_SLEEP which was the case before commit 40595cdc93ed
> ("nfs: block notification on fs with its own ->lock"). This behaviour
> seems to be broken before. This patch will fix the behaviour for the
> special nfs case before commit 40595cdc93ed ("nfs: block notification on
> fs with its own ->lock").
> 
> There is still a TODO of solving the case when an nfs locking request
> got interrupted.
> 
> Fixes: 40595cdc93ed ("nfs: block notification on fs with its own ->lock")
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

