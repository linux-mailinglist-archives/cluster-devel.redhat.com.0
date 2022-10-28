Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBB611924
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Oct 2022 19:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666977676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TiyugYXi6dd0u5x3hQc+w6auzUndctIKJRp0bqJ4m5k=;
	b=cP+oDlVsRa+UzYuuEfMzsf1IgOmwJ5uRF5OP/vThwfww6kminQDpN0cfyHuMll+IppNw5P
	PzXRgkltPc3B7X4Lz3OVBU/Jhz7Kc8+ukrUVSg9EUi7d1z4ODTrqUnJ1KEHYQSJWDqLGEx
	Q2cB9PjZEiaXRMqb2NIuXLeJdlLN/Fw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-dPd4RI8cMDK8HFtd-nZTHQ-1; Fri, 28 Oct 2022 13:21:13 -0400
X-MC-Unique: dPd4RI8cMDK8HFtd-nZTHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3159785A583;
	Fri, 28 Oct 2022 17:21:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5252024CB7;
	Fri, 28 Oct 2022 17:21:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3911C19466DF;
	Fri, 28 Oct 2022 17:21:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A860B1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 17:21:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 850F7111F3C7; Fri, 28 Oct 2022 17:21:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DB481121315
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 17:21:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58BD5380407D
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 17:21:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-BcLayksqN5GZDx7B0cQb_w-1; Fri, 28 Oct 2022 13:21:05 -0400
X-MC-Unique: BcLayksqN5GZDx7B0cQb_w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F01DA629D3;
 Fri, 28 Oct 2022 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8D6C433D7;
 Fri, 28 Oct 2022 17:21:00 +0000 (UTC)
Message-ID: <95e1afd00e550ee227dd5d76a5947a2176730e1d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
 linux-fsdevel@vger.kernel.org, David Howells <dhowells@redhat.com>
Date: Fri, 28 Oct 2022 13:20:58 -0400
In-Reply-To: <20221017202451.4951-9-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-9-vishal.moola@gmail.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v3 08/23] ceph: Convert
 ceph_writepages_start() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-10-17 at 13:24 -0700, Vishal Moola (Oracle) wrote:
> Convert function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
>=20
> Also some minor renaming for consistency.
>=20
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/ceph/addr.c | 58 ++++++++++++++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 28 deletions(-)
>=20
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index dcf701b05cc1..d2361d51db39 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -792,7 +792,7 @@ static int ceph_writepages_start(struct address_space=
 *mapping,
>  =09struct ceph_vino vino =3D ceph_vino(inode);
>  =09pgoff_t index, start_index, end =3D -1;
>  =09struct ceph_snap_context *snapc =3D NULL, *last_snapc =3D NULL, *pgsn=
apc;
> -=09struct pagevec pvec;
> +=09struct folio_batch fbatch;
>  =09int rc =3D 0;
>  =09unsigned int wsize =3D i_blocksize(inode);
>  =09struct ceph_osd_request *req =3D NULL;
> @@ -821,7 +821,7 @@ static int ceph_writepages_start(struct address_space=
 *mapping,
>  =09if (fsc->mount_options->wsize < wsize)
>  =09=09wsize =3D fsc->mount_options->wsize;
> =20
> -=09pagevec_init(&pvec);
> +=09folio_batch_init(&fbatch);
> =20
>  =09start_index =3D wbc->range_cyclic ? mapping->writeback_index : 0;
>  =09index =3D start_index;
> @@ -869,7 +869,7 @@ static int ceph_writepages_start(struct address_space=
 *mapping,
> =20
>  =09while (!done && index <=3D end) {
>  =09=09int num_ops =3D 0, op_idx;
> -=09=09unsigned i, pvec_pages, max_pages, locked_pages =3D 0;
> +=09=09unsigned i, nr_folios, max_pages, locked_pages =3D 0;
>  =09=09struct page **pages =3D NULL, **data_pages;
>  =09=09struct page *page;
>  =09=09pgoff_t strip_unit_end =3D 0;
> @@ -879,13 +879,13 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>  =09=09max_pages =3D wsize >> PAGE_SHIFT;
> =20
>  get_more_pages:
> -=09=09pvec_pages =3D pagevec_lookup_range_tag(&pvec, mapping, &index,
> -=09=09=09=09=09=09end, PAGECACHE_TAG_DIRTY);
> -=09=09dout("pagevec_lookup_range_tag got %d\n", pvec_pages);
> -=09=09if (!pvec_pages && !locked_pages)
> +=09=09nr_folios =3D filemap_get_folios_tag(mapping, &index,
> +=09=09=09=09end, PAGECACHE_TAG_DIRTY, &fbatch);
> +=09=09dout("pagevec_lookup_range_tag got %d\n", nr_folios);
> +=09=09if (!nr_folios && !locked_pages)
>  =09=09=09break;
> -=09=09for (i =3D 0; i < pvec_pages && locked_pages < max_pages; i++) {
> -=09=09=09page =3D pvec.pages[i];
> +=09=09for (i =3D 0; i < nr_folios && locked_pages < max_pages; i++) {
> +=09=09=09page =3D &fbatch.folios[i]->page;
>  =09=09=09dout("? %p idx %lu\n", page, page->index);
>  =09=09=09if (locked_pages =3D=3D 0)
>  =09=09=09=09lock_page(page);  /* first page */
> @@ -995,7 +995,7 @@ static int ceph_writepages_start(struct address_space=
 *mapping,
>  =09=09=09=09len =3D 0;
>  =09=09=09}
> =20
> -=09=09=09/* note position of first page in pvec */
> +=09=09=09/* note position of first page in fbatch */
>  =09=09=09dout("%p will write page %p idx %lu\n",
>  =09=09=09     inode, page, page->index);
> =20
> @@ -1005,30 +1005,30 @@ static int ceph_writepages_start(struct address_s=
pace *mapping,
>  =09=09=09=09fsc->write_congested =3D true;
> =20
>  =09=09=09pages[locked_pages++] =3D page;
> -=09=09=09pvec.pages[i] =3D NULL;
> +=09=09=09fbatch.folios[i] =3D NULL;
> =20
>  =09=09=09len +=3D thp_size(page);
>  =09=09}
> =20
>  =09=09/* did we get anything? */
>  =09=09if (!locked_pages)
> -=09=09=09goto release_pvec_pages;
> +=09=09=09goto release_folios;
>  =09=09if (i) {
>  =09=09=09unsigned j, n =3D 0;
> -=09=09=09/* shift unused page to beginning of pvec */
> -=09=09=09for (j =3D 0; j < pvec_pages; j++) {
> -=09=09=09=09if (!pvec.pages[j])
> +=09=09=09/* shift unused page to beginning of fbatch */
> +=09=09=09for (j =3D 0; j < nr_folios; j++) {
> +=09=09=09=09if (!fbatch.folios[j])
>  =09=09=09=09=09continue;
>  =09=09=09=09if (n < j)
> -=09=09=09=09=09pvec.pages[n] =3D pvec.pages[j];
> +=09=09=09=09=09fbatch.folios[n] =3D fbatch.folios[j];
>  =09=09=09=09n++;
>  =09=09=09}
> -=09=09=09pvec.nr =3D n;
> +=09=09=09fbatch.nr =3D n;
> =20
> -=09=09=09if (pvec_pages && i =3D=3D pvec_pages &&
> +=09=09=09if (nr_folios && i =3D=3D nr_folios &&
>  =09=09=09    locked_pages < max_pages) {
> -=09=09=09=09dout("reached end pvec, trying for more\n");
> -=09=09=09=09pagevec_release(&pvec);
> +=09=09=09=09dout("reached end fbatch, trying for more\n");
> +=09=09=09=09folio_batch_release(&fbatch);
>  =09=09=09=09goto get_more_pages;
>  =09=09=09}
>  =09=09}
> @@ -1164,10 +1164,10 @@ static int ceph_writepages_start(struct address_s=
pace *mapping,
>  =09=09if (wbc->nr_to_write <=3D 0 && wbc->sync_mode =3D=3D WB_SYNC_NONE)
>  =09=09=09done =3D true;
> =20
> -release_pvec_pages:
> -=09=09dout("pagevec_release on %d pages (%p)\n", (int)pvec.nr,
> -=09=09     pvec.nr ? pvec.pages[0] : NULL);
> -=09=09pagevec_release(&pvec);
> +release_folios:
> +=09=09dout("folio_batch release on %d folios (%p)\n", (int)fbatch.nr,
> +=09=09     fbatch.nr ? fbatch.folios[0] : NULL);
> +=09=09folio_batch_release(&fbatch);
>  =09}
> =20
>  =09if (should_loop && !done) {
> @@ -1184,15 +1184,17 @@ static int ceph_writepages_start(struct address_s=
pace *mapping,
>  =09=09=09unsigned i, nr;
>  =09=09=09index =3D 0;
>  =09=09=09while ((index <=3D end) &&
> -=09=09=09       (nr =3D pagevec_lookup_tag(&pvec, mapping, &index,
> -=09=09=09=09=09=09PAGECACHE_TAG_WRITEBACK))) {
> +=09=09=09       (nr =3D filemap_get_folios_tag(mapping, &index,
> +=09=09=09=09=09=09(pgoff_t)-1,
> +=09=09=09=09=09=09PAGECACHE_TAG_WRITEBACK,
> +=09=09=09=09=09=09&fbatch))) {
>  =09=09=09=09for (i =3D 0; i < nr; i++) {
> -=09=09=09=09=09page =3D pvec.pages[i];
> +=09=09=09=09=09page =3D &fbatch.folios[i]->page;
>  =09=09=09=09=09if (page_snap_context(page) !=3D snapc)
>  =09=09=09=09=09=09continue;
>  =09=09=09=09=09wait_on_page_writeback(page);
>  =09=09=09=09}
> -=09=09=09=09pagevec_release(&pvec);
> +=09=09=09=09folio_batch_release(&fbatch);
>  =09=09=09=09cond_resched();
>  =09=09=09}
>  =09=09}

I took a brief look and this looks like a fairly straightforward
conversion. It definitely needs testing however.

The hope was to get ceph converted over to using the netfs write
helpers, but that's taking a lot longer than expected. It's really up to
Xiubo at this point, but I don't have an issue in principle with taking
this patch in before the netfs conversion, particularly if it's blocking
other work.

Acked-by: Jeff Layton <jlayton@kernel.org>

