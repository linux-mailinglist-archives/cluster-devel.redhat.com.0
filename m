Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8CE1FF96F
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Jun 2020 18:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592498444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CZdiN1VzwBNAhzRiP+t4X3D5GOp3lpIEnvRx1Z7VTak=;
	b=fkfcIWGw9U/cVguwnmb0Qzvg0KuoGlr8ggPVygwKzkjmcIOoQgJvEPNyMPadpWpTLlMuTp
	Tsw5zLJDHZfbTvxkmkllA211eh57OYyW+mSt+NJQrBojsxI7cyFAuTEgl1rM4bXZRBJY3T
	1i/G4gMZ80ApoJpC4DOvoUTGdPsNszw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Bh3jiRO0Ppm_N_3zt2f_Cw-1; Thu, 18 Jun 2020 12:40:41 -0400
X-MC-Unique: Bh3jiRO0Ppm_N_3zt2f_Cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 561C9EC1A3;
	Thu, 18 Jun 2020 16:40:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 403E45EDE2;
	Thu, 18 Jun 2020 16:40:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35A98833C6;
	Thu, 18 Jun 2020 16:40:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IGeWkm030590 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 12:40:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9257F7FD4; Thu, 18 Jun 2020 16:40:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4D5BF7FD3
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 16:40:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2789185A78B
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 16:40:29 +0000 (UTC)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
	[209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-IGPGJTFfM4S_9z_QRdc9xA-1; Thu, 18 Jun 2020 12:40:28 -0400
X-MC-Unique: IGPGJTFfM4S_9z_QRdc9xA-1
Received: by mail-oo1-f69.google.com with SMTP id u4so3021957ood.6
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 09:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K+ZmXo1VT3DgmlBxctO5wOawFr9Ym28t9PdelfkR48g=;
	b=CzO6+SU8/HVL7puEJ6Is79rZ2JEOS5DNV9ZkxFR7aJZR8I+0kb4XwuIMn6jvnAJJ8y
	b76VkrOfk8KbDKmmuW/L20O/GUGBonrR8aU+jZ3tQCglLgqQ4STtsLnLgp136v/Pih5N
	JQP+kIamkWMZ/fO50ZWBD48ek/x2fGtix2//LRBOivJkCdfMIk96yFotC/ad1R0d+811
	O6P3H92ZCLhZcxfj9wYiMf1R3agqxZr9Dyy1arbocqpKVLAsQIAqmxWZshrXl5tRUCLd
	FqxN8KwM4jjSipDeo0jGAXb6OYX0Bae5Nxk04GYBbobiKUl807UOUQRoCGcdwPalLdBG
	3AFg==
X-Gm-Message-State: AOAM533d93JsLohgYgLnmCdIZak5JkVm0RusBQv4Fyvrsm3GjV/e9NUa
	YVh1tn6CbL7FYzmM52nhnaidNQRRVczZWZo2g/Zbjlx5rxPJ8l5BhNfiQik+lmUtOGA9trYP1sM
	K5JleeVVOqsXQvbZrAJWvDCokdRp09lSY265PEQ==
X-Received: by 2002:a05:6830:10c8:: with SMTP id
	z8mr4000190oto.95.1592498427403; 
	Thu, 18 Jun 2020 09:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE8nhb2Q0d4GxQpaInRB14NGapvcWpYnTg96Ky3B2ltZU9DxgAABVkj/Ptn9PHhgl8mMoH1G9lpq5ufccfhow=
X-Received: by 2002:a05:6830:10c8:: with SMTP id
	z8mr4000168oto.95.1592498427103; 
	Thu, 18 Jun 2020 09:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-17-willy@infradead.org>
	<CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
	<20200617003216.GC8681@bombadil.infradead.org>
	<CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
	<20200617022157.GF8681@bombadil.infradead.org>
	<CAHc6FU7NLRHKRJJ6c2kQT0ig8ed1n+3qR-YcSCWzXOeJCUsLbA@mail.gmail.com>
	<20200618150309.GP8681@bombadil.infradead.org>
In-Reply-To: <20200618150309.GP8681@bombadil.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 18 Jun 2020 18:40:15 +0200
Message-ID: <CAHc6FU6TYTiQ0a0GkN1dhh3VeQKVKrL+eALvuYzZ8nq5jvNHjg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IGeWkm030590
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>,
	=?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, Junxiao Bi <junxiao.bi@oracle.com>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, Linux-MM <linux-mm@kvack.org>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v11 16/25] fs: Convert mpage_readpages
	to mpage_readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, Jun 18, 2020 at 5:03 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Jun 18, 2020 at 02:46:03PM +0200, Andreas Gruenbacher wrote:
> > On Wed, Jun 17, 2020 at 4:22 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > On Wed, Jun 17, 2020 at 02:57:14AM +0200, Andreas GrÃ¼nbacher wrote:
> > > > Right, the approach from the following thread might fix this:
> > > >
> > > > https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redhat.com/T/#t
> > >
> > > In general, I think this is a sound approach.
> > >
> > > Specifically, I think FAULT_FLAG_CACHED can go away.  map_pages()
> > > will bring in the pages which are in the page cache, so when we get to
> > > gfs2_fault(), we know there's a reason to acquire the glock.
> >
> > We'd still be grabbing a glock while holding a dependent page lock.
> > Another process could be holding the glock and could try to grab the
> > same page lock (i.e., a concurrent writer), leading to the same kind
> > of deadlock.
>
> What I'm saying is that gfs2_fault should just be:
>
> +static vm_fault_t gfs2_fault(struct vm_fault *vmf)
> +{
> +       struct inode *inode = file_inode(vmf->vma->vm_file);
> +       struct gfs2_inode *ip = GFS2_I(inode);
> +       struct gfs2_holder gh;
> +       vm_fault_t ret;
> +       int err;
> +
> +       gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
> +       err = gfs2_glock_nq(&gh);
> +       if (err) {
> +               ret = block_page_mkwrite_return(err);
> +               goto out_uninit;
> +       }
> +       ret = filemap_fault(vmf);
> +       gfs2_glock_dq(&gh);
> +out_uninit:
> +       gfs2_holder_uninit(&gh);
> +       return ret;
> +}
>
> because by the time gfs2_fault() is called, map_pages() has already been
> called and has failed to insert the necessary page, so we should just
> acquire the glock now instead of trying again to look for the page in
> the page cache.

Okay, that's great.

Thanks,
Andreas


