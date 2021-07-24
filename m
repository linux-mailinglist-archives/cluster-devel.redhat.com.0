Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9B83E3D463F
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 10:05:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-2hKu3kxsNVGNJWahUBXbGQ-1; Sat, 24 Jul 2021 04:05:42 -0400
X-MC-Unique: 2hKu3kxsNVGNJWahUBXbGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0AC51084F4C;
	Sat, 24 Jul 2021 08:05:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE8ED1970E;
	Sat, 24 Jul 2021 08:05:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 799DD180BAB1;
	Sat, 24 Jul 2021 08:05:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16O85Zpf015756 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 04:05:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6ED461054F93; Sat, 24 Jul 2021 08:05:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A2F41031F22
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 08:05:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20F39800B35
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 08:05:32 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-581-Ls2GMxODNgCFOOCF6tsdIA-1; Sat, 24 Jul 2021 04:05:29 -0400
X-MC-Unique: Ls2GMxODNgCFOOCF6tsdIA-1
Received: by mail-io1-f46.google.com with SMTP id m13so5275132iol.7;
	Sat, 24 Jul 2021 01:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9SULVsagS4dB16WkbeqR+XAZ1fs3eU5Cq64+TOTbFWY=;
	b=HfC5+PwT059Ad70c+N9L44zqYhQ0yDKuWRZWXmgqiT1JnTNWZIAAj+y/mixjSouDSc
	7VLNk8vSpdi7TYDeXTKPKejOIzrSkcdBtG7RI3YakMLrOJP3ww9UnTsXguaAgA3JTTHx
	8cVcUsM8mrNM+/ZW4OJimhCI8WNiMLAD9lHlQTunjamW6Vy+hK7NQ8ZA5X6E683G+VY6
	BISZX0cyocn3OO/pW6rW9S9Ha1XFvUb5K7I9TbHpluRcezpbtRW+dXdUJGFFxQruz0VH
	RbyfKUjvBmfGVLThIH/FliZC5IJ4wnPWjQgDoPucqOYzq1gqxI+E1e2I0WdoTCiFN6IF
	e5UA==
X-Gm-Message-State: AOAM530908nmR3SRvovELparVpAD3Fs61Tdqlr4lCooOsSvKBlvf4jAB
	B9cj7C7BlpDRgK27XOUKhFfRBLwm4zmCZ4JxOMA=
X-Google-Smtp-Source: ABdhPJxujkiDiDqSey8xGa8tGJOhl/wcoSF3auaSX6xq2RVAuE/Dqs2TFuW2iEIVRWFbyuCBwT/HU3fK4Z6wdjYmxSY=
X-Received: by 2002:a6b:c90f:: with SMTP id z15mr6718749iof.183.1627113929048; 
	Sat, 24 Jul 2021 01:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-2-agruenba@redhat.com>
	<YPtyRgyGqJX4Ya/R@zeniv-ca.linux.org.uk>
In-Reply-To: <YPtyRgyGqJX4Ya/R@zeniv-ca.linux.org.uk>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Sat, 24 Jul 2021 10:05:17 +0200
Message-ID: <CAHpGcMJThSqjowuEGCzjNFN8y5tq8kxmxfSivwtuTEMK_xd-cQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 1/7] iov_iter: Introduce
	fault_in_iov_iter helper
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Sa., 24. Juli 2021 um 03:53 Uhr schrieb Al Viro <viro@zeniv.linux.org.uk>:
> On Fri, Jul 23, 2021 at 10:58:34PM +0200, Andreas Gruenbacher wrote:
> > Introduce a new fault_in_iov_iter helper for manually faulting in an iterator.
> > Other than fault_in_pages_writeable(), this function is non-destructive.
> >
> > We'll use fault_in_iov_iter in gfs2 once we've determined that the iterator
> > passed to .read_iter or .write_iter isn't in memory.
>
> Hmm...  I suspect that this is going to be much heavier for read access
> than the existing variant.  Do we ever want it for anything other than
> writes?

I don't know if it actually is slower when pages need to be faulted
in, but I'm fine turning it into a write-only function.

Thanks,
Andreas

