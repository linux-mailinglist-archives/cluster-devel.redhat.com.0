Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D11084E7B2D
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Mar 2022 01:12:19 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-CJyJ5lW_NFuXlgYC4xBGAQ-1; Fri, 25 Mar 2022 20:12:15 -0400
X-MC-Unique: CJyJ5lW_NFuXlgYC4xBGAQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9641185A7A4;
	Sat, 26 Mar 2022 00:12:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCAD35E8A85;
	Sat, 26 Mar 2022 00:12:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5F9151940352;
	Sat, 26 Mar 2022 00:12:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D9E9D1940341 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 26 Mar 2022 00:12:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD175C15D7E; Sat, 26 Mar 2022 00:12:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B92B9C202C6
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 00:12:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BFE42A59540
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 00:12:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-kpp2SQFONEKapeFnKjBGKg-1; Fri, 25 Mar 2022 20:12:09 -0400
X-MC-Unique: kpp2SQFONEKapeFnKjBGKg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C094617E2;
 Sat, 26 Mar 2022 00:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DABC004DD;
 Sat, 26 Mar 2022 00:03:37 +0000 (UTC)
Date: Fri, 25 Mar 2022 17:03:37 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20220326000337.GD8182@magnolia>
References: <20220325143701.144731-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220325143701.144731-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [GIT PULL] fs/iomap: Fix buffered write page
 prefaulting
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 25, 2022 at 03:37:01PM +0100, Andreas Gruenbacher wrote:
> Hello Linus,
> 
> please consider pulling the following fix, which I've forgotten to send
> in the previous merge window.  I've only improved the patch description
> since.
> 
> Thank you very much,
> Andreas
> 
> The following changes since commit 42eb8fdac2fc5d62392dcfcf0253753e821a97b0:
> 
>   Merge tag 'gfs2-v5.16-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-11-17 15:55:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/write-page-prefaulting
> 
> for you to fetch changes up to 631f871f071746789e9242e514ab0f49067fa97a:
> 
>   fs/iomap: Fix buffered write page prefaulting (2022-03-25 15:14:03 +0100)

When was this sent to fsdevel for public consideration?  The last time I
saw any patches related to prefaulting in iomap was November.

--D

> 
> ----------------------------------------------------------------
> Fix buffered write page prefaulting
> 
> ----------------------------------------------------------------
> Andreas Gruenbacher (1):
>       fs/iomap: Fix buffered write page prefaulting
> 
>  fs/iomap/buffered-io.c | 2 +-
>  mm/filemap.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

