Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5B613B4C5
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 22:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579038681;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uk50vmK6VWirlJ4aDF1wQZ/1mOAwRyPkmW7mIiKK6f0=;
	b=PYt0VGVFv1hmRzmxRC/cPq2A39dNhBUffL+Qb8hHWu38Kypg6aakkLUJMjKQPlOcLNTppt
	tGiUSTL5flxtzMfzKeWgrdw1IH1Cg/sn/fiiasCiLDa+mzQJ/2sYgSaU7DCvkTY8ZHss1t
	82SM3oVoWHzjA9YYCyaC48co5e0ltQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-nf2VojQrNnObV8t9eFNHbw-1; Tue, 14 Jan 2020 16:51:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EF061005516;
	Tue, 14 Jan 2020 21:51:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40CD960BE2;
	Tue, 14 Jan 2020 21:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D10DA1809567;
	Tue, 14 Jan 2020 21:51:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00ELp6P3008499 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 16:51:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DAC43C68F5; Tue, 14 Jan 2020 21:51:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B8A1C72F
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 21:51:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BC19801E9B
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 21:51:05 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-w5DD-JVeNm-HKa0lf4Xkow-1; Tue, 14 Jan 2020 16:51:01 -0500
Received: from callcc.thunk.org (guestnat-104-133-0-108.corp.google.com
	[104.133.0.108] (may be forged)) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00ELoN8O028997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 14 Jan 2020 16:50:24 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
	id 5833A4207DF; Tue, 14 Jan 2020 16:50:23 -0500 (EST)
Date: Tue, 14 Jan 2020 16:50:23 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200114215023.GH140865@mit.edu>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200114161225.309792-9-hch@lst.de>
X-MC-Unique: w5DD-JVeNm-HKa0lf4Xkow-1
X-MC-Unique: nf2VojQrNnObV8t9eFNHbw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00ELp6P3008499
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Cluster-devel] [PATCH 08/12] ext4: hold i_rwsem until AIO
	completes
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 05:12:21PM +0100, Christoph Hellwig wrote:
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 0e8708b77da6..b6aa2d249b30 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -4777,9 +4777,6 @@ static long ext4_zero_range(struct file *file, loff=
_t offset,
>  =09if (mode & FALLOC_FL_KEEP_SIZE)
>  =09=09flags |=3D EXT4_GET_BLOCKS_KEEP_SIZE;
> =20
> -=09/* Wait all existing dio workers, newcomers will block on i_mutex */
> -=09inode_dio_wait(inode);
> -
>  =09/* Preallocate the range including the unaligned edges */
>  =09if (partial_begin || partial_end) {
>  =09=09ret =3D ext4_alloc_file_blocks(file,

I note that you've dropped the inode_dio_wait() in ext4's ZERO_RANGE,
COLLAPSE_RANGE, INSERT_RANGE, etc.  We had added these to avoid
problems when various fallocate operations which modify the inode's
logical->physical block mapping racing with direct I/O (both reads or
writes).

I don't see a replacement protection in this patch series.  How does
are file systems supported to protect against such races?

    =09 =09 =09      =09      =09      - Ted


