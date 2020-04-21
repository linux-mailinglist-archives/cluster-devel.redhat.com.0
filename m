Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A49021B200B
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Apr 2020 09:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587454867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7APprk7t+JfFmApyrUMHoPQSiXfpoHvNq5e3N9zNREg=;
	b=BjPupe2JSjGfqQgWWBagfN2cemNyl6HYJb7pYFn+dWoTzD3d5J+VxjcbsLXuKuLRPC2pd4
	Czyt8xNpgOBdqsN32e1eNmjuil5xoiezyrEyo1PuGKv1wkUJdsIuEgbobsunSYjsvn2JAm
	4jmlxEUgxEYhH79fiuNNAvSSUSpHwQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-klM-p3Z-MQO4rzR6t0pNag-1; Tue, 21 Apr 2020 03:41:06 -0400
X-MC-Unique: klM-p3Z-MQO4rzR6t0pNag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B48FF8017F3;
	Tue, 21 Apr 2020 07:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50A4111E7FA;
	Tue, 21 Apr 2020 07:41:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 646179390B;
	Tue, 21 Apr 2020 07:41:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03L7V9XT002488 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 03:31:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 003921000DB3; Tue, 21 Apr 2020 07:31:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD3F100296E
	for <cluster-devel@redhat.com>; Tue, 21 Apr 2020 07:31:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BADED867B07
	for <cluster-devel@redhat.com>; Tue, 21 Apr 2020 07:31:06 +0000 (UTC)
Received: from sonic309-49.consmr.mail.ne1.yahoo.com
	(sonic309-49.consmr.mail.ne1.yahoo.com [66.163.184.175]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-157-MaJeVy9XPpyymoAvkY2pcQ-1;
	Tue, 21 Apr 2020 03:31:02 -0400
X-MC-Unique: MaJeVy9XPpyymoAvkY2pcQ-1
X-YMail-OSG: ZLEfS2sVM1lk0I6iQYW5PaC27I6c61k7i1jV62cC4k.LmLL85pmV5Bd1SzzocJs
	sRfj94Pu4n3wFv1H_bhWjKvopCKSTupX0RCYaDhBaUw4l2N0pSafWoYv1p7Gw8PadYcrpqeTJkmo
	x.vFg3ICrxKeHJe5A2VjBgVUEF_eugMhyT2Kzqr946MYTvBF0X25MXIHn.W6.2gGmuFxfVNfaJbk
	wf1cvUYnRTlz9VbmQ8jqsBWcWWybpFhhWarQb6ys_3OK4WNIHvOc4acXtDGYtFUo9mGbPDdixfii
	.HyxC5mNMUnl7mF5dDGXJk.NzpSa9FZzkes7m9A7H764xLIzf5hXzgHq73Dw8qQTc6ZysClNsbE7
	Cqg9zJzR_MaVhtU0.wAbKgwJzQHR1iJ55jaOcg0byMOZ0uoQBJAH6TuYXoONFmR8od58M32mpPWr
	kURn0vEpDgo6ziJSLwNCffWjfg29YmK5biUHIxwVkaZMtJMwypJqiKONdSszFXqeKZfkZ43yMVzk
	NPsOGpF.B8McUrusJ8bU8V5_Pw64P2MzyRG_xOqHU4PEVJ8QcHSUKutvC17bM3hlbXN2URZlENMd
	d8Vf1DHE0kXtkkPZ4VOiSoIDBZgLuWkasmiahU4upu6la7rTzo9lzmbxZtBgCASkn1ZknrsBuanq
	s4gwFJJjx5JRJ0M1OfPm.ljypeTz2C8k.2sDFGlFcZsVpIqoi40CLTwWZeDTLPR4EziHpb3AWhiQ
	Wny4DBpwdRD7gPOjsiGO6w9OZAtrGiJd3daH7ELv6V9EsinNln6wYjpf.P03ZtSSeGVjLpj3gwC5
	4ZQ6xDPuavzeSH5cPOYSWdDTfO.IUhjmAJhRjKlmSu6B5Wa6rtLrtlScqypRMQAKGuAV8YduU5KI
	8eYtkpmUVzCmZgEhtfKGxS2GYC7jxikiAGdV2ElykH1jwQOXG9_6MJeHgM_S7wG.sIVzW5BvY46S
	U3gM0PK5AVuKU8r8W4jpC5_MOIUbRM1UFWE9AR4pGtumwfhniOhER3TyiCVZI2xKHrkD432P83Gd
	mZN3fPspYLogkNTC4Pp5BnehwQnuS7.Q1LEDG7K4yXIHWEWw5JIZ46YoZm5pXFYVnPVa0w84MN_.
	8ErDK4fqws8tDW_ASdgJBiWOupx35rpfu.rPF2224lydresvTjLnTIf8lFnhXN7BgaLoaBZcuELo
	7d7.6T.VinNDGuXqbdmE_ducuAYaeJ7cmmW3_ZpH5nIJXxXTPL1SLIUhl1cz6mcX_baEL4kuRe7G
	QBHv3bahyaZqtCrIWnR0n7wmtRNy2FEYSnHq3oUlt19LRQgWfoZcQe_GuDMFKfNB5Pxuoy3b4KVt
	CFMHhQXta0y6ZgvoOw5i9EEPCWKsh5_gwAwF5XcK3wkcG3LGE6p37DRvSe3ZA6rk.EbJd2mEQghM
	kIyy4lSay2M49R9IvFN5a5UPkXOLi14eHbk.8BNbLJhtErNaT725b8ay_JaMv_czB0ue.SfOtgpY
	XWyRQdpzwRYjzGhxb6.MNFQCTSQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 21 Apr 2020 07:31:01 +0000
Received: by smtp407.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 98aed6c61d98e300b5dca39559149029; 
	Tue, 21 Apr 2020 07:28:59 +0000 (UTC)
Date: Tue, 21 Apr 2020 15:28:51 +0800
From: Gao Xiang <hsiangkao@aol.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200421072839.GA13867@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-20-willy@infradead.org>
	<20200420224210.dff005bc62957a4d81d58226@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20200420224210.dff005bc62957a4d81d58226@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03L7V9XT002488
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 Apr 2020 03:40:56 -0400
Cc: cluster-devel@redhat.com, Gao Xiang <gaoxiang25@huawei.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v11 19/25] erofs: Convert compressed
 files from readpages to readahead
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Andrew,

On Mon, Apr 20, 2020 at 10:42:10PM -0700, Andrew Morton wrote:
> On Tue, 14 Apr 2020 08:02:27 -0700 Matthew Wilcox <willy@infradead.org> w=
rote:
>=20
> >=20
> > Use the new readahead operation in erofs.
> >=20
>=20
> Well this is exciting.
>=20
> fs/erofs/data.c: In function erofs_raw_access_readahead:
> fs/erofs/data.c:149:18: warning: last_block may be used uninitialized in =
this function [-Wmaybe-uninitialized]
> =09*last_block + 1 !=3D current_block) {
>=20
> It seems to be a preexisting bug, which your patch prompted gcc-7.2.0
> to notice.
>=20
> erofs_read_raw_page() goes in and uses *last_block, but neither of its
> callers has initialized it.  Could the erofs maintainers please take a
> look?

simply because last_block doesn't need to be initialized at first,
because bio =3D=3D NULL in the begining anyway. I believe this is a gcc
false warning because some gcc versions raised some before (many gccs
don't, including my current gcc (Debian 8.3.0-6) 8.3.0).

in detail,

146         /* note that for readpage case, bio also equals to NULL */
147         if (bio &&
148             /* not continuous */
149             *last_block + 1 !=3D current_block) {
150 submit_bio_retry:
151                 submit_bio(bio);
152                 bio =3D NULL;
153         }

bio will be NULL and will bypass the next condition at first.
after that,

155         if (!bio) {

...

221                 bio =3D bio_alloc(GFP_NOIO, nblocks);

...

}

...

230         err =3D bio_add_page(bio, page, PAGE_SIZE, 0);
231         /* out of the extent or bio is full */
232         if (err < PAGE_SIZE)
233                 goto submit_bio_retry;
234
235         *last_block =3D current_block;

so bio !=3D NULL, and last_block will be assigned then as well.

Thanks,
Gao Xiang



