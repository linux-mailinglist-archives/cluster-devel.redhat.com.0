Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48691740321
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 20:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687890206;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RKaUc0ORs/Gd1GdxJAwW8s88XVZd+wYdJXcZEtG1yX0=;
	b=QECRwvFgU27DB0kWC2MPzgR3w/gSIfHUweeL7FuyE0sa9sM5hkyXHQbSZJuMhJ7tUv5YBR
	yMmqa/+Nt5WhKg70nkMaHsfSJX6SuwMqRD1W62b+1G4NUXgFZ0FEox83AreerPIlb32Zds
	4nZUUgD3jPm2ztrb4UuHV+yHJgcRDO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-u_E1GZTBM-uJHrhJ_LvTPQ-1; Tue, 27 Jun 2023 14:23:21 -0400
X-MC-Unique: u_E1GZTBM-uJHrhJ_LvTPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B5078ED602;
	Tue, 27 Jun 2023 18:23:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D19F7200A3AD;
	Tue, 27 Jun 2023 18:23:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A4FC1946589;
	Tue, 27 Jun 2023 18:23:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 133B91946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 18:23:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F170A48FB01; Tue, 27 Jun 2023 18:23:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9F5040140F
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 18:23:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD93980027F
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 18:23:10 +0000 (UTC)
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-R8wWUp4VNF2NJ5N6YbopRw-1; Tue,
 27 Jun 2023 14:23:06 -0400
X-MC-Unique: R8wWUp4VNF2NJ5N6YbopRw-1
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Tue, 27 Jun 2023 20:23:04 +0200 (CEST)
X-EA-Auth: nBW1evf6hYP/qjFtPSmMco89i5xksIBGwtxo96zJLVokltIuQIua963927lrc3svbdLapoVV1EaSLFp0i1O1PIZI1IrMVgFA
Date: Tue, 27 Jun 2023 23:52:59 +0530
From: Deepak R Varma <drv@mailo.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <ZJspAwi5NycJopQf@bu2204.myguest.virtualbox.org>
References: <ZJk1XTtgLFxIcxzp@bu2204.myguest.virtualbox.org>
 <CAHc6FU6P-BK=rU2w6JcswJsf93TwgvtUNNBe8LU4n2djuNjn_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6P-BK=rU2w6JcswJsf93TwgvtUNNBe8LU4n2djuNjn_Q@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2] gfs2: Replace deprecated
 kmap_atomic() by kmap_local_page()
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
Cc: Sumitra Sharma <sumitraartsy@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 27, 2023 at 03:45:20PM +0200, Andreas Gruenbacher wrote:
> On Mon, Jun 26, 2023 at 8:51 AM Deepak R Varma <drv@mailo.com> wrote:
> > kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().
> 
> I'll apply this, convert the remaining instances of kmap_atomic(), and
> switch to memcpy_{from,to}_page() where appropriate.

Hello Andreas,
Thank you for your review. I am working on the other conversion opportunities
for this module and will send those in shortly.

Regards,
Deepak.

> 
> Thanks,
> Andreas
> 
> > Therefore, replace kmap_atomic() with kmap_local_page() in
> > gfs2_internal_read() and stuffed_readpage().
> >
> > kmap_atomic() disables page-faults and preemption (the latter only for
> > !PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
> > gfs2_internal_read() and stuffed_readpage() does not depend on the
> > above-mentioned side effects.
> >
> > Therefore, a mere replacement of the old API with the new one is all that
> > is required (i.e., there is no need to explicitly add any calls to
> > pagefault_disable() and/or preempt_disable()).
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> > Note: The Patch is build tested only. I will be happy to run recommended testing
> > with some guidance if required.
> >
> > Changes in v2:
> >    - Update patch description to correct the replacement function name from
> >      kmap_local_folio to kmap_local _page
> >
> >
> >  fs/gfs2/aops.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> > index 3b41542d6697..7bd92054d353 100644
> > --- a/fs/gfs2/aops.c
> > +++ b/fs/gfs2/aops.c
> > @@ -432,10 +432,10 @@ static int stuffed_readpage(struct gfs2_inode *ip, struct page *page)
> >         if (error)
> >                 return error;
> >
> > -       kaddr = kmap_atomic(page);
> > +       kaddr = kmap_local_page(page);
> >         memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
> >         memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
> > -       kunmap_atomic(kaddr);
> > +       kunmap_local(kaddr);
> >         flush_dcache_page(page);
> >         brelse(dibh);
> >         SetPageUptodate(page);
> > @@ -498,12 +498,12 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
> >                                 continue;
> >                         return PTR_ERR(page);
> >                 }
> > -               p = kmap_atomic(page);
> > +               p = kmap_local_page(page);
> >                 amt = size - copied;
> >                 if (offset + size > PAGE_SIZE)
> >                         amt = PAGE_SIZE - offset;
> >                 memcpy(buf + copied, p + offset, amt);
> > -               kunmap_atomic(p);
> > +               kunmap_local(p);
> >                 put_page(page);
> >                 copied += amt;
> >                 index++;
> > --
> > 2.34.1
> >
> >
> >
> 


