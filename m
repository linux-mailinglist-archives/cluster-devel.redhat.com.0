Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5426618F200
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 10:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584956493;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G2tUlzD24nOferUXcbqf96y0f/xlhZKfWT3Sg33Yus4=;
	b=Hsi7jJ/cJNTpX76pmQm6XU4UE52wrkyZj6nY/SqyvD9qHMCgYr3BVXT1rup01dtwHKwaYE
	9/cZlgBch5nQ/8XOcjC3hRmCISkEU2cfUZc2nDpuZl+rbQRMouaPRZ1ztPoGDkXgwZgtxd
	qDVx51usNZxx2VL1nsavJu7oCMNTPDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-quuLvjeiMjCXrbyU1Q0LtA-1; Mon, 23 Mar 2020 05:41:31 -0400
X-MC-Unique: quuLvjeiMjCXrbyU1Q0LtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76CC390FD6C;
	Mon, 23 Mar 2020 09:41:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D42E419C4F;
	Mon, 23 Mar 2020 09:41:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5B2C863B3;
	Mon, 23 Mar 2020 09:41:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KNOPsB005752 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 19:24:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8D602028DCC; Fri, 20 Mar 2020 23:24:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4B1F2028DCB
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 23:24:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFE068007A4
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 23:24:22 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-233-odfQP7fKMtGMFjt4iznWDQ-1; Fri, 20 Mar 2020 19:24:20 -0400
X-MC-Unique: odfQP7fKMtGMFjt4iznWDQ-1
Received: by mail-ot1-f68.google.com with SMTP id a6so7666029otb.10;
	Fri, 20 Mar 2020 16:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r1RjSBup4MWDnxcSCK94McxMdoDpG8eO0JDhY4wpKR0=;
	b=gFoHyR8CBedbWq6RW1IHE0Nv26lMKQ1u/Gjoore4J+wxw2GnwpDepxz9elLlfOQUin
	XJrh5Zz2TlkPkQrlW/tML5PDYy1aqWthlZQooJwOxONFN2AXANjmCCH8asMHVMfl+WyB
	h+XpQLr5iSg3IXeE8y61KZ9LOH5ZsBTMM/fpgAZSeLnhJGZz/FTPXc89QlgeDgNmS6Ad
	EnZXQgWUZiHyJRQOWV2jUg+hEiycNJ4z3VSjdSj/gIlsbn8imZJNYEBtoweCthowLM7l
	vUOOKOpEnchzfAgXIoFS+ferMhiHWRvxx254uX6Em9gdW6SolL/zDgnju+kcAejumEwZ
	WeXw==
X-Gm-Message-State: ANhLgQ1QFnpkAMpte2uFjaYGKJCUj/CJjC9OURbYMDwL407LBYY+M+sx
	QW+GozwM9JzHTs6lBWFScnRPHe3qxlTcNAM8+uWBCQ==
X-Google-Smtp-Source: ADFU+vvk42JpEDDDlDUp6QEGUIHSuidkoO4gJ/JVIxwHCPUSqqRu1OBVOgg9ZhRrthX3kgHdC2yuDHRY3AYH9iDgANA=
X-Received: by 2002:a05:6830:1608:: with SMTP id
	g8mr9414965otr.282.1584746659261; 
	Fri, 20 Mar 2020 16:24:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:8e:0:0:0:0:0 with HTTP;
	Fri, 20 Mar 2020 16:24:18 -0700 (PDT)
In-Reply-To: <20200320142231.2402-17-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-17-willy@infradead.org>
From: Namjae Jeon <linkinjeon@gmail.com>
Date: Sat, 21 Mar 2020 08:24:18 +0900
Message-ID: <CAKYAXd-NGQvMoYg=TV1T=8OZdQcYwcncK_Hix8OkF0GqmYr9Wg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KNOPsB005752
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Mar 2020 05:41:02 -0400
Cc: linux-xfs@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
	William Kucharski <william.kucharski@oracle.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v9 16/25] fs: Convert mpage_readpages to
	mpage_readahead
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> diff --git a/drivers/staging/exfat/exfat_super.c
> b/drivers/staging/exfat/exfat_super.c
> index b81d2a87b82e..96aad9b16d31 100644
> --- a/drivers/staging/exfat/exfat_super.c
> +++ b/drivers/staging/exfat/exfat_super.c
Maybe, You should change fs/exfat instead of staging/exfat that is
gone from -next ?

> @@ -3002,10 +3002,9 @@ static int exfat_readpage(struct file *file, struc=
t
> page *page)
>  =09return  mpage_readpage(page, exfat_get_block);
>  }
>
> -static int exfat_readpages(struct file *file, struct address_space
> *mapping,
> -=09=09=09   struct list_head *pages, unsigned int nr_pages)
> +static void exfat_readahead(struct readahead_control *rac)
>  {
> -=09return  mpage_readpages(mapping, pages, nr_pages, exfat_get_block);
> +=09mpage_readahead(rac, exfat_get_block);
>  }
>
>  static int exfat_writepage(struct page *page, struct writeback_control
> *wbc)
> @@ -3104,7 +3103,7 @@ static sector_t _exfat_bmap(struct address_space
> *mapping, sector_t block)
>
>  static const struct address_space_operations exfat_aops =3D {
>  =09.readpage    =3D exfat_readpage,
> -=09.readpages   =3D exfat_readpages,
> +=09.readahead   =3D exfat_readahead,
>  =09.writepage   =3D exfat_writepage,
>  =09.writepages  =3D exfat_writepages,
>  =09.write_begin =3D exfat_write_begin,


