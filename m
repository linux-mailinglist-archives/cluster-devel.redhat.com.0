Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3995F100C
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Sep 2022 18:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664555541;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LyqnbeSMAhEwg3aC+X5FZzq1OD+X299TjSBr480JgxE=;
	b=AJVf6U28IBAMg6iEnyRHsNI5SGzfjxDM0MqrSOhNQ2ig+YosEBVcbAP85hUypACAIkk/S0
	Pbuy41xc4nkEmLBHKdvot/xtrkFGbltwluShDpom92a0JogKCtPBExmdEAmxOnPxk6vwKO
	RQInAiV3OR2cL3iCqnGXrN7amoOGU0w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-mubgu_trPIabJ6pEm9CBBw-1; Fri, 30 Sep 2022 12:32:17 -0400
X-MC-Unique: mubgu_trPIabJ6pEm9CBBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C073785A5A6;
	Fri, 30 Sep 2022 16:32:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29F9F1121331;
	Fri, 30 Sep 2022 16:32:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BB8CB1946A68;
	Fri, 30 Sep 2022 16:32:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 167B41946A52 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 30 Sep 2022 16:32:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EF815205FA86; Fri, 30 Sep 2022 16:32:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7A86205FA85
 for <cluster-devel@redhat.com>; Fri, 30 Sep 2022 16:32:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4FA9101A5DC
 for <cluster-devel@redhat.com>; Fri, 30 Sep 2022 16:32:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-T4laf0CTPdqcKvAYDLgtMQ-1; Fri, 30 Sep 2022 12:32:10 -0400
X-MC-Unique: T4laf0CTPdqcKvAYDLgtMQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1C9A62382;
 Fri, 30 Sep 2022 16:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34001C433C1;
 Fri, 30 Sep 2022 16:25:17 +0000 (UTC)
Message-ID: <35d965bbc3d27e43d6743fc3a5cb042503a1b7bf.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
 linux-fsdevel@vger.kernel.org
Date: Fri, 30 Sep 2022 12:25:15 -0400
In-Reply-To: <20220912182224.514561-9-vishal.moola@gmail.com>
References: <20220912182224.514561-1-vishal.moola@gmail.com>
 <20220912182224.514561-9-vishal.moola@gmail.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v2 08/23] ceph: Convert
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-09-12 at 11:22 -0700, Vishal Moola (Oracle) wrote:
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>=20
> This change does NOT support large folios. This shouldn't be an issue as
> of now since ceph only utilizes folios of size 1 anyways, and there is a
> lot of work to be done on ceph conversions to folios for later patches
> at some point.
>=20
> Also some minor renaming for consistency.
>=20
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/ceph/addr.c | 138 +++++++++++++++++++++++++------------------------
>  1 file changed, 70 insertions(+), 68 deletions(-)
>=20
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index dcf701b05cc1..33dbe55b08be 100644
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
> @@ -869,9 +869,9 @@ static int ceph_writepages_start(struct address_space=
 *mapping,
> =20
>  =09while (!done && index <=3D end) {
>  =09=09int num_ops =3D 0, op_idx;
> -=09=09unsigned i, pvec_pages, max_pages, locked_pages =3D 0;
> +=09=09unsigned i, nr_folios, max_pages, locked_pages =3D 0;
>  =09=09struct page **pages =3D NULL, **data_pages;
> -=09=09struct page *page;
> +=09=09struct folio *folio;
>  =09=09pgoff_t strip_unit_end =3D 0;
>  =09=09u64 offset =3D 0, len =3D 0;
>  =09=09bool from_pool =3D false;
> @@ -879,28 +879,28 @@ static int ceph_writepages_start(struct address_spa=
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
> +=09=09dout("filemap_get_folios_tag got %d\n", nr_folios);
> +=09=09if (!nr_folios && !locked_pages)
>  =09=09=09break;
> -=09=09for (i =3D 0; i < pvec_pages && locked_pages < max_pages; i++) {
> -=09=09=09page =3D pvec.pages[i];
> -=09=09=09dout("? %p idx %lu\n", page, page->index);
> +=09=09for (i =3D 0; i < nr_folios && locked_pages < max_pages; i++) {
> +=09=09=09folio =3D fbatch.folios[i];
> +=09=09=09dout("? %p idx %lu\n", folio, folio->index);
>  =09=09=09if (locked_pages =3D=3D 0)
> -=09=09=09=09lock_page(page);  /* first page */
> -=09=09=09else if (!trylock_page(page))
> +=09=09=09=09folio_lock(folio); /* first folio */
> +=09=09=09else if (!folio_trylock(folio))
>  =09=09=09=09break;
> =20
>  =09=09=09/* only dirty pages, or our accounting breaks */
> -=09=09=09if (unlikely(!PageDirty(page)) ||
> -=09=09=09    unlikely(page->mapping !=3D mapping)) {
> -=09=09=09=09dout("!dirty or !mapping %p\n", page);
> -=09=09=09=09unlock_page(page);
> +=09=09=09if (unlikely(!folio_test_dirty(folio)) ||
> +=09=09=09    unlikely(folio->mapping !=3D mapping)) {
> +=09=09=09=09dout("!dirty or !mapping %p\n", folio);
> +=09=09=09=09folio_unlock(folio);
>  =09=09=09=09continue;
>  =09=09=09}
>  =09=09=09/* only if matching snap context */
> -=09=09=09pgsnapc =3D page_snap_context(page);
> +=09=09=09pgsnapc =3D page_snap_context(&folio->page);
>  =09=09=09if (pgsnapc !=3D snapc) {
>  =09=09=09=09dout("page snapc %p %lld !=3D oldest %p %lld\n",
>  =09=09=09=09     pgsnapc, pgsnapc->seq, snapc, snapc->seq);
> @@ -908,11 +908,10 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>  =09=09=09=09    !ceph_wbc.head_snapc &&
>  =09=09=09=09    wbc->sync_mode !=3D WB_SYNC_NONE)
>  =09=09=09=09=09should_loop =3D true;
> -=09=09=09=09unlock_page(page);
> +=09=09=09=09folio_unlock(folio);
>  =09=09=09=09continue;
>  =09=09=09}
> -=09=09=09if (page_offset(page) >=3D ceph_wbc.i_size) {
> -=09=09=09=09struct folio *folio =3D page_folio(page);
> +=09=09=09if (folio_pos(folio) >=3D ceph_wbc.i_size) {
> =20
>  =09=09=09=09dout("folio at %lu beyond eof %llu\n",
>  =09=09=09=09     folio->index, ceph_wbc.i_size);
> @@ -924,25 +923,26 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>  =09=09=09=09folio_unlock(folio);
>  =09=09=09=09continue;
>  =09=09=09}
> -=09=09=09if (strip_unit_end && (page->index > strip_unit_end)) {
> -=09=09=09=09dout("end of strip unit %p\n", page);
> -=09=09=09=09unlock_page(page);
> +=09=09=09if (strip_unit_end && (folio->index > strip_unit_end)) {
> +=09=09=09=09dout("end of strip unit %p\n", folio);
> +=09=09=09=09folio_unlock(folio);
>  =09=09=09=09break;
>  =09=09=09}
> -=09=09=09if (PageWriteback(page) || PageFsCache(page)) {
> +=09=09=09if (folio_test_writeback(folio) ||
> +=09=09=09=09=09folio_test_fscache(folio)) {
>  =09=09=09=09if (wbc->sync_mode =3D=3D WB_SYNC_NONE) {
> -=09=09=09=09=09dout("%p under writeback\n", page);
> -=09=09=09=09=09unlock_page(page);
> +=09=09=09=09=09dout("%p under writeback\n", folio);
> +=09=09=09=09=09folio_unlock(folio);
>  =09=09=09=09=09continue;
>  =09=09=09=09}
> -=09=09=09=09dout("waiting on writeback %p\n", page);
> -=09=09=09=09wait_on_page_writeback(page);
> -=09=09=09=09wait_on_page_fscache(page);
> +=09=09=09=09dout("waiting on writeback %p\n", folio);
> +=09=09=09=09folio_wait_writeback(folio);
> +=09=09=09=09folio_wait_fscache(folio);
>  =09=09=09}
> =20
> -=09=09=09if (!clear_page_dirty_for_io(page)) {
> -=09=09=09=09dout("%p !clear_page_dirty_for_io\n", page);
> -=09=09=09=09unlock_page(page);
> +=09=09=09if (!folio_clear_dirty_for_io(folio)) {
> +=09=09=09=09dout("%p !clear_page_dirty_for_io\n", folio);
> +=09=09=09=09folio_unlock(folio);
>  =09=09=09=09continue;
>  =09=09=09}
> =20
> @@ -958,7 +958,7 @@ static int ceph_writepages_start(struct address_space=
 *mapping,
>  =09=09=09=09u32 xlen;
> =20
>  =09=09=09=09/* prepare async write request */
> -=09=09=09=09offset =3D (u64)page_offset(page);
> +=09=09=09=09offset =3D (u64)folio_pos(folio);
>  =09=09=09=09ceph_calc_file_object_mapping(&ci->i_layout,
>  =09=09=09=09=09=09=09      offset, wsize,
>  =09=09=09=09=09=09=09      &objnum, &objoff,
> @@ -966,7 +966,7 @@ static int ceph_writepages_start(struct address_space=
 *mapping,
>  =09=09=09=09len =3D xlen;
> =20
>  =09=09=09=09num_ops =3D 1;
> -=09=09=09=09strip_unit_end =3D page->index +
> +=09=09=09=09strip_unit_end =3D folio->index +
>  =09=09=09=09=09((len - 1) >> PAGE_SHIFT);
> =20
>  =09=09=09=09BUG_ON(pages);
> @@ -981,54 +981,53 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>  =09=09=09=09}
> =20
>  =09=09=09=09len =3D 0;
> -=09=09=09} else if (page->index !=3D
> +=09=09=09} else if (folio->index !=3D
>  =09=09=09=09   (offset + len) >> PAGE_SHIFT) {
>  =09=09=09=09if (num_ops >=3D (from_pool ?  CEPH_OSD_SLAB_OPS :
>  =09=09=09=09=09=09=09     CEPH_OSD_MAX_OPS)) {
> -=09=09=09=09=09redirty_page_for_writepage(wbc, page);
> -=09=09=09=09=09unlock_page(page);
> +=09=09=09=09=09folio_redirty_for_writepage(wbc, folio);
> +=09=09=09=09=09folio_unlock(folio);
>  =09=09=09=09=09break;
>  =09=09=09=09}
> =20
>  =09=09=09=09num_ops++;
> -=09=09=09=09offset =3D (u64)page_offset(page);
> +=09=09=09=09offset =3D (u64)folio_pos(folio);
>  =09=09=09=09len =3D 0;
>  =09=09=09}
> =20
> -=09=09=09/* note position of first page in pvec */
> +=09=09=09/* note position of first page in fbatch */
>  =09=09=09dout("%p will write page %p idx %lu\n",
> -=09=09=09     inode, page, page->index);
> +=09=09=09     inode, folio, folio->index);
> =20
>  =09=09=09if (atomic_long_inc_return(&fsc->writeback_count) >
>  =09=09=09    CONGESTION_ON_THRESH(
>  =09=09=09=09    fsc->mount_options->congestion_kb))
>  =09=09=09=09fsc->write_congested =3D true;
> =20
> -=09=09=09pages[locked_pages++] =3D page;
> -=09=09=09pvec.pages[i] =3D NULL;
> +=09=09=09pages[locked_pages++] =3D &folio->page;
> +=09=09=09fbatch.folios[i] =3D NULL;
> =20
> -=09=09=09len +=3D thp_size(page);
> +=09=09=09len +=3D folio_size(folio);
>  =09=09}
> =20
>  =09=09/* did we get anything? */
>  =09=09if (!locked_pages)
> -=09=09=09goto release_pvec_pages;
> +=09=09=09goto release_folio_batches;
>  =09=09if (i) {
>  =09=09=09unsigned j, n =3D 0;
> -=09=09=09/* shift unused page to beginning of pvec */
> -=09=09=09for (j =3D 0; j < pvec_pages; j++) {
> -=09=09=09=09if (!pvec.pages[j])
> +=09=09=09/* shift unused folio to the beginning of fbatch */
> +=09=09=09for (j =3D 0; j < nr_folios; j++) {
> +=09=09=09=09if (!fbatch.folios[j])
>  =09=09=09=09=09continue;
>  =09=09=09=09if (n < j)
> -=09=09=09=09=09pvec.pages[n] =3D pvec.pages[j];
> +=09=09=09=09=09fbatch.folios[n] =3D fbatch.folios[j];
>  =09=09=09=09n++;
>  =09=09=09}
> -=09=09=09pvec.nr =3D n;
> -
> -=09=09=09if (pvec_pages && i =3D=3D pvec_pages &&
> +=09=09=09fbatch.nr =3D n;
> +=09=09=09if (nr_folios && i =3D=3D nr_folios &&
>  =09=09=09    locked_pages < max_pages) {
> -=09=09=09=09dout("reached end pvec, trying for more\n");
> -=09=09=09=09pagevec_release(&pvec);
> +=09=09=09=09dout("reached end of fbatch, trying for more\n");
> +=09=09=09=09folio_batch_release(&fbatch);
>  =09=09=09=09goto get_more_pages;
>  =09=09=09}
>  =09=09}
> @@ -1056,7 +1055,7 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>  =09=09=09BUG_ON(IS_ERR(req));
>  =09=09}
>  =09=09BUG_ON(len < page_offset(pages[locked_pages - 1]) +
> -=09=09=09     thp_size(page) - offset);
> +=09=09=09     folio_size(folio) - offset);
> =20
>  =09=09req->r_callback =3D writepages_finish;
>  =09=09req->r_inode =3D inode;
> @@ -1098,7 +1097,7 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>  =09=09=09set_page_writeback(pages[i]);
>  =09=09=09if (caching)
>  =09=09=09=09ceph_set_page_fscache(pages[i]);
> -=09=09=09len +=3D thp_size(page);
> +=09=09=09len +=3D folio_size(folio);
>  =09=09}
>  =09=09ceph_fscache_write_to_cache(inode, offset, len, caching);
> =20
> @@ -1108,7 +1107,7 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>  =09=09=09/* writepages_finish() clears writeback pages
>  =09=09=09 * according to the data length, so make sure
>  =09=09=09 * data length covers all locked pages */
> -=09=09=09u64 min_len =3D len + 1 - thp_size(page);
> +=09=09=09u64 min_len =3D len + 1 - folio_size(folio);
>  =09=09=09len =3D get_writepages_data_length(inode, pages[i - 1],
>  =09=09=09=09=09=09=09 offset);
>  =09=09=09len =3D max(len, min_len);
> @@ -1164,10 +1163,10 @@ static int ceph_writepages_start(struct address_s=
pace *mapping,
>  =09=09if (wbc->nr_to_write <=3D 0 && wbc->sync_mode =3D=3D WB_SYNC_NONE)
>  =09=09=09done =3D true;
> =20
> -release_pvec_pages:
> -=09=09dout("pagevec_release on %d pages (%p)\n", (int)pvec.nr,
> -=09=09     pvec.nr ? pvec.pages[0] : NULL);
> -=09=09pagevec_release(&pvec);
> +release_folio_batches:
> +=09=09dout("folio_batch_release on %d batches (%p)", (int) fbatch.nr,
> +=09=09=09=09fbatch.nr ? fbatch.folios[0] : NULL);
> +=09=09folio_batch_release(&fbatch);
>  =09}
> =20
>  =09if (should_loop && !done) {
> @@ -1180,19 +1179,22 @@ static int ceph_writepages_start(struct address_s=
pace *mapping,
>  =09=09if (wbc->sync_mode !=3D WB_SYNC_NONE &&
>  =09=09    start_index =3D=3D 0 && /* all dirty pages were checked */
>  =09=09    !ceph_wbc.head_snapc) {
> -=09=09=09struct page *page;
> +=09=09=09struct folio *folio;
>  =09=09=09unsigned i, nr;
>  =09=09=09index =3D 0;
>  =09=09=09while ((index <=3D end) &&
> -=09=09=09       (nr =3D pagevec_lookup_tag(&pvec, mapping, &index,
> -=09=09=09=09=09=09PAGECACHE_TAG_WRITEBACK))) {
> +=09=09=09=09(nr =3D filemap_get_folios_tag(mapping, &index,
> +=09=09=09=09=09=09(pgoff_t)-1,
> +=09=09=09=09=09=09PAGECACHE_TAG_WRITEBACK,
> +=09=09=09=09=09=09&fbatch))) {
>  =09=09=09=09for (i =3D 0; i < nr; i++) {
> -=09=09=09=09=09page =3D pvec.pages[i];
> -=09=09=09=09=09if (page_snap_context(page) !=3D snapc)
> +=09=09=09=09=09folio =3D fbatch.folios[i];
> +=09=09=09=09=09if (page_snap_context(&folio->page) !=3D
> +=09=09=09=09=09=09=09snapc)
>  =09=09=09=09=09=09continue;
> -=09=09=09=09=09wait_on_page_writeback(page);
> +=09=09=09=09=09folio_wait_writeback(folio);
>  =09=09=09=09}
> -=09=09=09=09pagevec_release(&pvec);
> +=09=09=09=09folio_batch_release(&fbatch);
>  =09=09=09=09cond_resched();
>  =09=09=09}
>  =09=09}


We have some work in progress to add write helpers to netfslib. Once we
get those in place, we plan to convert ceph to use them. At that point
ceph_writepages just goes away.

I think it'd be best to just wait for that and to just ensure that
netfslib uses filemap_get_folios_tag and the like where appropriate.
--=20
Jeff Layton <jlayton@kernel.org>

