Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081C6DC910
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Apr 2023 18:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681142796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KNqYd+1QnmqRLV5Ajn8FT5thAplwqJoHO3FJBlZCT9M=;
	b=JwUGMaSf+IgCi5M4NZy42lu7SrVqMriayM9C4jw82oxIK3TlYProjjcgai7dYcj86raCSf
	mK9b6jKA1HgTfogUuWvm1vinF4PBMqFhaqxkpoEE9VgzYE8bOmdTTIRPOY1GpV3WHHvGUO
	ytQQSO1GTAEtfwVEco3adhnDxMqgrr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-6t_E53JWOAWia1irWAjnAA-1; Mon, 10 Apr 2023 12:06:31 -0400
X-MC-Unique: 6t_E53JWOAWia1irWAjnAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24A6180D0FB;
	Mon, 10 Apr 2023 16:06:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79E122166B30;
	Mon, 10 Apr 2023 16:06:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C8AF19466DF;
	Mon, 10 Apr 2023 16:06:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A1781946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Apr 2023 16:06:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E799840BC799; Mon, 10 Apr 2023 16:06:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFD5E40BC797
 for <cluster-devel@redhat.com>; Mon, 10 Apr 2023 16:06:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6723C0F197
 for <cluster-devel@redhat.com>; Mon, 10 Apr 2023 16:06:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-0GG6u9xaOgCKYfEGsqfGAw-1; Mon, 10 Apr 2023 12:06:23 -0400
X-MC-Unique: 0GG6u9xaOgCKYfEGsqfGAw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE73F61D67;
 Mon, 10 Apr 2023 16:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9468C433AA;
 Mon, 10 Apr 2023 16:06:20 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id e20so5475192lji.6;
 Mon, 10 Apr 2023 09:06:20 -0700 (PDT)
X-Gm-Message-State: AAQBX9fQCSFFRjakTUYCOPobHgWOVEpm9fdGrKuJEupzCYXRV/LW+Nhk
 EgBAGlJWFH2wTsmt1TwguW9SlfMn3PRIbsl9PAU=
X-Google-Smtp-Source: AKy350ZYTf5+tNtIInJ56xYELpkw807n6pcDQqxLzwYNn5kC/wsk/lyy0ZRj6GpVdiG1eSqStA2SCDFU3pUWbh96/vU=
X-Received: by 2002:a2e:b0e2:0:b0:2a5:fe8f:b314 with SMTP id
 h2-20020a2eb0e2000000b002a5fe8fb314mr2152243ljl.5.1681142778696; Mon, 10 Apr
 2023 09:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
 <8b8a3bb2db8c5183ef36c1810f2ac776ac526327.1680172791.git.johannes.thumshirn@wdc.com>
 <CAPhsuW7a+mpn+VprfA2mC5Fc+M9BFq8i6d-y+-o5G1u5dOsk2Q@mail.gmail.com>
 <bbc98aa3-24f0-8ee6-9d74-483564a14f0f@kernel.org>
In-Reply-To: <bbc98aa3-24f0-8ee6-9d74-483564a14f0f@kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 10 Apr 2023 09:06:06 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4yQjNgHZpw4UzkhC+GkY+aAFSjC-PDQFFoL-Wg-u2r1Q@mail.gmail.com>
Message-ID: <CAPhsuW4yQjNgHZpw4UzkhC+GkY+aAFSjC-PDQFFoL-Wg-u2r1Q@mail.gmail.com>
To: Johannes Thumshirn <jth@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 17/19] md: raid1: check if adding
 pages to resync bio fails
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 linux-mm@kvack.org, dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 1:26=E2=80=AFAM Johannes Thumshirn <jth@kernel.org> =
wrote:
>
> On 31/03/2023 20:13, Song Liu wrote:
> > On Thu, Mar 30, 2023 at 3:44=E2=80=AFAM Johannes Thumshirn
> > <johannes.thumshirn@wdc.com> wrote:
> >>
> >> Check if adding pages to resync bio fails and if bail out.
> >>
> >> As the comment above suggests this cannot happen, WARN if it actually
> >> happens.
> >>
> >> This way we can mark bio_add_pages as __must_check.
> >>
> >> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> >> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> >> ---
> >>   drivers/md/raid1-10.c |  7 ++++++-
> >>   drivers/md/raid10.c   | 12 ++++++++++--
> >>   2 files changed, 16 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
> >> index e61f6cad4e08..c21b6c168751 100644
> >> --- a/drivers/md/raid1-10.c
> >> +++ b/drivers/md/raid1-10.c
> >> @@ -105,7 +105,12 @@ static void md_bio_reset_resync_pages(struct bio =
*bio, struct resync_pages *rp,
> >>                   * won't fail because the vec table is big
> >>                   * enough to hold all these pages
> >>                   */
> >
> > We know these won't fail. Shall we just use __bio_add_page?
>
> We could yes, but I kind of like the assert() style warning.
> But of cause ultimately your call.

The assert() style warning is fine. In this case, please remove the
"won't fail ..." comments.

Thanks,
Song

