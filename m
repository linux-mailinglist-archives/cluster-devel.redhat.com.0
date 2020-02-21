Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 67FE41681D0
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 16:36:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582299372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lUrMNGahd+eRwBR0ksfFLMGBlkZWDuTlTWtNtmpMhtM=;
	b=KcTPppBp1bCxrGH1973CJmiTrll7UFBGVou7OwXGJ/WbMazfyatcGv49vb0TeiTW6tXMhk
	ZRgkSBlXLigfO6G3ZjtoD4OIQhRiozdWBtxA9JPKS+CXcIaRqD7LiLlwWRFsjosDv5teZW
	hQjQ2hPuNK7KgA5nfY9FIcfCx3jgjUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-QHMgXjUXOACboxuTFmpcZw-1; Fri, 21 Feb 2020 10:36:08 -0500
X-MC-Unique: QHMgXjUXOACboxuTFmpcZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED9D28017DF;
	Fri, 21 Feb 2020 15:36:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5C9B1001281;
	Fri, 21 Feb 2020 15:36:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98976860C1;
	Fri, 21 Feb 2020 15:36:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01LFZujV006809 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 10:35:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 15EBB1649CC; Fri, 21 Feb 2020 15:35:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BEEA1649E3
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 15:35:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0674101A55A
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 15:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-261-S1vs28-1M4-Kp92MzCu4TA-1; Fri, 21 Feb 2020 10:35:48 -0500
X-MC-Unique: S1vs28-1M4-Kp92MzCu4TA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j5AL3-00062c-43; Fri, 21 Feb 2020 15:35:37 +0000
Date: Fri, 21 Feb 2020 07:35:37 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200221153537.GE24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-12-willy@infradead.org>
	<e6ef2075-b849-299e-0f11-c6ee82b0a3c7@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <e6ef2075-b849-299e-0f11-c6ee82b0a3c7@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01LFZujV006809
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 11/24] mm: Move end_index check out
	of readahead loop
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 07:50:39PM -0800, John Hubbard wrote:
> This tiny patch made me pause, because I wasn't sure at first of the exac=
t
> intent of the lines above. Once I worked it out, it seemed like it might
> be helpful (or overkill??) to add a few hints for the reader, especially =
since
> there are no hints in the function's (minimal) documentation header. What
> do you think of this?
>=20
> =09/*
> =09 * If we can't read *any* pages without going past the inodes's isize
> =09 * limit, give up entirely:
> =09 */
> =09if (index > end_index)
> =09=09return;
>=20
> =09/* Cap nr_to_read, in order to avoid overflowing the ULONG type: */
> =09if (index + nr_to_read < index)
> =09=09nr_to_read =3D ULONG_MAX - index + 1;
>=20
> =09/* Cap nr_to_read, to avoid reading past the inode's isize limit: */
> =09if (index + nr_to_read >=3D end_index)
> =09=09nr_to_read =3D end_index - index + 1;

A little verbose for my taste ... How about this?

        end_index =3D (isize - 1) >> PAGE_SHIFT;
        if (index > end_index)
                return;
        /* Avoid wrapping to the beginning of the file */
        if (index + nr_to_read < index)
                nr_to_read =3D ULONG_MAX - index + 1;
        /* Don't read past the page containing the last byte of the file */
        if (index + nr_to_read >=3D end_index)
                nr_to_read =3D end_index - index + 1;


