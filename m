Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9044C466
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Nov 2021 16:29:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636558169;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=JGaRarhvw23xm4PTZjUPJaQyjQW9oMGbXcgdEZdlsWo=;
	b=g1jVZ/BDTkyVK5BhHha7UkAYh/RNnU4Gso76NikUoANgEhR6p3r8svuoy1/W3/aBIaS7eA
	R3Vw3RidiU/QSmSjdLnMMlKLQoTCYc5UwEvFF07ebP0kw3L/17zXG+QIh+nf3QMy1tK2Za
	23AvYVZgMfNAMIE4DYk6mWYraT8sYtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-bcrQ6JYCNE2Ikqhav3LwUA-1; Wed, 10 Nov 2021 10:29:26 -0500
X-MC-Unique: bcrQ6JYCNE2Ikqhav3LwUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DB221DDF0;
	Wed, 10 Nov 2021 15:29:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADBB860C05;
	Wed, 10 Nov 2021 15:29:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 087391818480;
	Wed, 10 Nov 2021 15:29:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AAEqF6i028262 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 09:52:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CBE7340CFD11; Wed, 10 Nov 2021 14:52:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C667240CFD0B
	for <cluster-devel@redhat.com>; Wed, 10 Nov 2021 14:52:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6C04811E78
	for <cluster-devel@redhat.com>; Wed, 10 Nov 2021 14:52:15 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-523-xTLDRgEvNUG7AGiRCQFt3g-1; Wed, 10 Nov 2021 09:52:14 -0500
X-MC-Unique: xTLDRgEvNUG7AGiRCQFt3g-1
Received: by mail-wm1-f70.google.com with SMTP id
	y9-20020a1c7d09000000b003316e18949bso1227145wmc.5
	for <cluster-devel@redhat.com>; Wed, 10 Nov 2021 06:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JGaRarhvw23xm4PTZjUPJaQyjQW9oMGbXcgdEZdlsWo=;
	b=URrI1Nl4XhiZRN+AixEk+Q++u+RHVQpA4cXu98WBiY/r6zTqvXyivkYnK50n6aI05q
	Dgb0FMZgGCii2DwpqUvRAqXJLzVD4XZoDdupeM6Wy7D3tM6h1Lbs3aIVZVqOpa1Guenq
	UvOgyFbvPBpWonk0qLzrpRd36ZdKyPSNYSeLbzhFr7x90y4l3asLGaoqKJUs69X5O3zw
	PHHvUaZHJq93NDdHW8OnOWj4MsuWBhdBJLw8O1P4/rjIredL2ytLw2Z1LRsBC8+bIET7
	tLaKBfQi2TXfFVbYICoERKp6vCkU6MK7/z+fyCZfQX2wYe2TTKSf3fKVxB1O080eLyAY
	1D5g==
X-Gm-Message-State: AOAM531tydvz6Ddu0C3kc9aAFSAuDjRirudgm++IEHQ9cdR92KQm03Nl
	Jv79sd3AWugNATnCEvvmiVVR+ElbMu3+/V3coSqTNT4RVZDOlxwxWxZ5VI+RHnsipmg8GNRkyoB
	AY7wLMkRh4Fx2gVMwLPgblf5yI5TD60Mej7+hnQ==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr356457wrr.11.1636555932914;
	Wed, 10 Nov 2021 06:52:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6l6A0hw8OFbT4CeKMWuzjHe409Rc88qj5MEQ+MgMfrW4P0aNPr9xBjEscvoB2kMqOlJr33ybNzTxG6gtHVog=
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr356435wrr.11.1636555932767;
	Wed, 10 Nov 2021 06:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20211110113842.517426-1-agruenba@redhat.com>
	<20211110125527.GA25465@lst.de>
In-Reply-To: <20211110125527.GA25465@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 10 Nov 2021 15:52:01 +0100
Message-ID: <CAHc6FU49TnYvrL-FU5oz9th6STuQ=eYokjsD+0QpbkdHedRd9w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	stable <stable@vger.kernel.org>, cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [5.15 REGRESSION] iomap: Fix inline extent
	handling in iomap_readpage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 1:55 PM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Nov 10, 2021 at 12:38:42PM +0100, Andreas Gruenbacher wrote:
> > +     if (iomap->type == IOMAP_INLINE) {
> > +             /*
> > +              * The filesystem sets iomap->length to the size of the inline
> > +              * data.  We're at the end of the file, so we know that the
> > +              * rest of the page needs to be zeroed out.
> > +              */
> > +             iomap->length = iomap_read_inline_data(iter, page);
> > +             return iomap->length;
>
> You can't just change iomap->length here.  Fix the file system to
> return the right length, please.

Hmm, that doesn't make sense to me: the filesystem doesn't know that
iomap_readpage will pad to page boundaries. This happens at the iomap
layer, so the iomap layer should also deal with the consequences.
We're using different alignment rules here and for direct I/O, so that
makes fake-aligning the extent size in iomap_begin even more
questionable.

"Fixing" the extent size the filesystem returns would also break
direct I/O. We could add some additional padding code to
iomap_dio_inline_iter to deal with that, but currently, there's no
need for that.

Thanks,
Andreas

