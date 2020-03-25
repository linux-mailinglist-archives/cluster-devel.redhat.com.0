Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 584DC192B6E
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Mar 2020 15:44:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585147454;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SGC6/wXPFbD7zSFrNmgOBd2hLbNC2XuhlO22kKwqpF4=;
	b=aAh540sdbfpEMw5NaJgE+4ZwSPPI9QZV7x6dS+sBVkKxQTZsf6BYeTFXiPpLnJV3qYpMgO
	kqwLSlg/jwXRjxS+g7dOTjnKaHZylgoLszETV2ckdYZ90Ty0qyMZB8Emc3sCT00Yhxn1AU
	4S+OTIgBiq/BNBQV/8ihSD5FKm3qQsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-ByZV4lBsNFi9N6O4S7DTpw-1; Wed, 25 Mar 2020 10:44:12 -0400
X-MC-Unique: ByZV4lBsNFi9N6O4S7DTpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45C219057A2;
	Wed, 25 Mar 2020 14:44:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E8E91D9B;
	Wed, 25 Mar 2020 14:44:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FC7886386;
	Wed, 25 Mar 2020 14:44:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PEhLVR010851 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 10:43:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 408E0100404C; Wed, 25 Mar 2020 14:43:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C8B810A58DB
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 14:43:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5AAA185A78E
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 14:43:18 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-tfn32Wv0NqO6f097qHS2PQ-1; Wed, 25 Mar 2020 10:43:14 -0400
X-MC-Unique: tfn32Wv0NqO6f097qHS2PQ-1
Received: by mail-io1-f66.google.com with SMTP id o127so2491745iof.0
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 07:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BYoi0GgKGrZ5Iy05aE5oc1zP5UUaQTjapju/izAR4hI=;
	b=UW1xpFIx71XXcXSRPH0DM3dW5n4EoiyeVf0NZFdIXX10lZhVAK+zJEXhtN215Rrsrz
	/1NKLZk5Kfp/90J1I4vinA/EafOQPesJ5CJFZaV3Vn+7ItgJ6XwdPrfi8jXBRNdNrvGL
	ALOSUE0A2/x4rXbK/e6JLl0O0fQAUFLt+H15WAZYLNcfene+Aduw0DIrO9EjCUUaiXJE
	3a/JNU9DGz5QQ1Atzx5J0UTz9oYQrvpl/bAbpqfN0lLbI29U4l70bf9lceZzPk4uBQa9
	dYhpeCbYicz6IIsWoVbK2bqwQdNP3e6QKfe7roIGY6n+iJUkJnMTWYXVu/4by0PW/TOo
	DUvw==
X-Gm-Message-State: ANhLgQ2bgMj+poMbBzTkU8lpUkkZUhFxiVtjAd1REOaFRDm4IpYTb8Th
	Sy5+lll5iHzwss3YX7GkI0zaWWgeR9C5myo1wvLdig==
X-Google-Smtp-Source: ADFU+vsgMMqodCZqPGFNfCT+HdNRTtLLlUdy5AMnDcVBoatxWj+vZY48emoAVNd+HvHliFjTkg/kdF6pmkOGcZxuC6s=
X-Received: by 2002:a6b:3a07:: with SMTP id h7mr3235359ioa.191.1585147393572; 
	Wed, 25 Mar 2020 07:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-25-willy@infradead.org>
	<CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
	<20200325120254.GA22483@bombadil.infradead.org>
In-Reply-To: <20200325120254.GA22483@bombadil.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 25 Mar 2020 15:43:02 +0100
Message-ID: <CAJfpegshssCJiA8PBcq2XvBj3mR8dufHb0zWRFvvKKv82VQYsw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PEhLVR010851
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v10 24/25] fuse: Convert from readpages
	to readahead
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 1:02 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Mar 25, 2020 at 10:42:56AM +0100, Miklos Szeredi wrote:
> > > +       while ((page =3D readahead_page(rac))) {
> > > +               if (fuse_readpages_fill(&data, page) !=3D 0)
> >
> > Shouldn't this unlock + put page on error?
>
> We're certainly inconsistent between the two error exits from
> fuse_readpages_fill().  But I think we can simplify the whole thing
> ... how does this look to you?

Nice, overall.

>
> -       while ((page =3D readahead_page(rac))) {
> -               if (fuse_readpages_fill(&data, page) !=3D 0)
> +               nr_pages =3D min(readahead_count(rac), fc->max_pages);

Missing fc->max_read clamp.

> +               ia =3D fuse_io_alloc(NULL, nr_pages);
> +               if (!ia)
>                         return;
> +               ap =3D &ia->ap;
> +               __readahead_batch(rac, ap->pages, nr_pages);

nr_pages =3D __readahead_batch(...)?

This will give consecutive pages, right?

Thanks,
Miklos


