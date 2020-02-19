Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9492E164394
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 12:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582112537;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kMyF5Um+A4rUYHTOfWhQWXWGz6Iwf499S2wD31gqxPg=;
	b=Ey41zmU6LvfKMx/IKraHEMomVIztbTEjXT3cfD/DHXIo71gsPDq5p6pU6AMaJA30fU12+f
	DjcKIeY8lq9RM3Ra/xQQ9FvXu3s+hxkxzzFaNNx4Trw8lu/iaXFttjsXLcZqqlMr2/7lCj
	j63eFThliAGqPdhgWubXi4CcLjQVbSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-lAG7DMatNu-hnQtfOxVZ-g-1; Wed, 19 Feb 2020 06:42:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9738C107ACCD;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4497260C88;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18FC035B19;
	Wed, 19 Feb 2020 11:42:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3TffJ006729 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:29:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B72231004C7F; Wed, 19 Feb 2020 03:29:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B224310F8E0C
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:29:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC51F1801902
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:29:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-426-4m5b-I22OWOM63DbjVuR6g-1;
	Tue, 18 Feb 2020 22:29:37 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AB6A824658;
	Wed, 19 Feb 2020 03:29:35 +0000 (UTC)
Date: Tue, 18 Feb 2020 19:29:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219032934.GC1075@sol.localdomain>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-25-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-25-willy@infradead.org>
X-MC-Unique: 4m5b-I22OWOM63DbjVuR6g-1
X-MC-Unique: lAG7DMatNu-hnQtfOxVZ-g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3TffJ006729
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 19 Feb 2020 06:42:02 -0500
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 14/19] ext4: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:46:05AM -0800, Matthew Wilcox wrote:
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index c1769afbf799..e14841ade612 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -7,8 +7,8 @@
>   *
>   * This was originally taken from fs/mpage.c
>   *
> - * The intent is the ext4_mpage_readpages() function here is intended
> - * to replace mpage_readpages() in the general case, not just for
> + * The ext4_mpage_readahead() function here is intended to
> + * replace mpage_readahead() in the general case, not just for
>   * encrypted files.  It has some limitations (see below), where it
>   * will fall back to read_block_full_page(), but these limitations
>   * should only be hit when page_size !=3D block_size.
> @@ -222,8 +222,7 @@ static inline loff_t ext4_readpage_limit(struct inode=
 *inode)
>  }

This says ext4_mpage_readahead(), but it's actually still called
ext4_mpage_readpages().

- Eric


