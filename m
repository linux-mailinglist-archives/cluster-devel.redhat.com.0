Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 128C4165F27
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 14:49:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582206565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yfkc390TJc6Lv7MlSdpRfDGWz2hwPIY8eQ/Dg2iqgtA=;
	b=Ei/I0mrTkOo5UcW9uJ6fLdH81z9M4mJQtuJMNdAjoTr+RYlD83WZZq7ZtcJJBxT7EB7plk
	ukR+1C/ww4DtI4YzPGUtt8ujMb9eBy6xwSLFfKqedbxtPyOUiwtif/PkJ+Hsb8i3ntlcba
	81n8NXW31WVMo3b7I9z8SxdpgR47lUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-K_glx1PmOvG5Y99tChJIww-1; Thu, 20 Feb 2020 08:49:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 199868014D1;
	Thu, 20 Feb 2020 13:49:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4F890F69;
	Thu, 20 Feb 2020 13:49:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4851F18089C8;
	Thu, 20 Feb 2020 13:49:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KDnCQS018233 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 08:49:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AEEB32016F2C; Thu, 20 Feb 2020 13:49:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F512017EA5
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 13:49:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 858F6800296
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 13:49:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-432-tMS0IjO-OwGexYYX4yswVQ-1; Thu, 20 Feb 2020 08:49:07 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4mC9-0006TC-8A; Thu, 20 Feb 2020 13:48:49 +0000
Date: Thu, 20 Feb 2020 05:48:49 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Message-ID: <20200220134849.GV24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-15-willy@infradead.org>
	<SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
X-MC-Unique: tMS0IjO-OwGexYYX4yswVQ-1
X-MC-Unique: K_glx1PmOvG5Y99tChJIww-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KDnCQS018233
X-loop: cluster-devel@redhat.com
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v7 14/24] btrfs: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 09:42:19AM +0000, Johannes Thumshirn wrote:
> On 19/02/2020 22:03, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > Use the new readahead operation in btrfs.  Add a
> > readahead_for_each_batch() iterator to optimise the loop in the XArray.
>=20
> OK I must admit I haven't followed this series closely, but what=20
> happened to said readahead_for_each_batch()?
>=20
> As far as I can see it's now:
>=20
> [...]
> > +=09while ((nr =3D readahead_page_batch(rac, pagepool))) {

Oops, forgot to update the changelog there.  Yes, that's exactly what it
changed to.  That discussion was here:

https://lore.kernel.org/linux-fsdevel/20200219144117.GP24185@bombadil.infra=
dead.org/

... and then Christoph pointed out the iterators weren't really adding
much value at that point, so they got deleted.  New changelog for
this patch:

btrfs: Convert from readpages to readahead
 =20
Implement the new readahead method in btrfs.  Add a readahead_page_batch()
to optimise fetching a batch of pages at once.


