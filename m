Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2B6CF829
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 02:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680135486;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GFrxtn9d5G2riP70vvdw/yu25SnT/y5gfBPSK+n92IU=;
	b=gKBvN5lmUV1qmTWoUH16Ig+DBMX6NiZukANshSkPGuSRdX0R8NQgXPessBdbgr2kkZHJDk
	ASmInULOaX216gGgc3Er6a8AtGG5I94DKhreg+oct2xjGrrHGujQ42NZgi7W5CFt/yNPjf
	T8BTUk1RWecNRmpfwSQFpkE3lZlxpbs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-uJqkqhRPMUOkTMca4dq6Ug-1; Wed, 29 Mar 2023 20:18:05 -0400
X-MC-Unique: uJqkqhRPMUOkTMca4dq6Ug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B713814592;
	Thu, 30 Mar 2023 00:18:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F04492166B33;
	Thu, 30 Mar 2023 00:18:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEED7194658F;
	Thu, 30 Mar 2023 00:18:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 57CA51946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 00:18:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2941C2166B34; Thu, 30 Mar 2023 00:18:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2244D2166B33
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 00:18:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 045CB185A78F
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 00:18:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-gI5Mgs1EOpmh3iB4ecsEfg-1; Wed, 29 Mar 2023 20:18:00 -0400
X-MC-Unique: gI5Mgs1EOpmh3iB4ecsEfg-1
Received: by mail-pg1-f170.google.com with SMTP id y19so10356754pgk.5;
 Wed, 29 Mar 2023 17:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680135478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFrxtn9d5G2riP70vvdw/yu25SnT/y5gfBPSK+n92IU=;
 b=LpKtAgQOX94WhCiGz+FmMEF7U1gU0jCibl4DWGljYdDCaBkxnXHC3fSYA+o/Ks3Ta8
 MVe2td7/8s7RPhkgDN+MemyN/NQ9iCwXbUUJ7kab4ue7PoqgokQL/yHOYnJ/DwpeRWQs
 3dV43p3Ns8o3EQhoyiKjUhFRLaVUQ3Eh3qs2Sm38XSa1AYzXcCxaxtIFKpyCku3jHPyg
 P5qd6yQrqLBdaFt1mjwxu+ZoAgw0nVQ3fjygb8zqlT3vLSEpXGPhMt5KvRCFBUIgxbvu
 21LQ+2D2g+mDUPJrkJzYrrhT2FY423lMsqoC4JvPd0GU2kFZ6HAW1u7JvP4tD+bA03pm
 SjlA==
X-Gm-Message-State: AAQBX9cVVe7zSB4p8f6NTo0qef23oOZxCmc182ghcZKdBVV+XkYsKu5C
 kW7f/ANrAsrAfMVWjfx80TlL5M5/xXuQFx2YIP8=
X-Google-Smtp-Source: AKy350aEVPs1e5xvudW7+v0SaWp4yk4rckHRftoj/jiGIVi7YJx59Ax0QojqF2IskeBIF4cBFMwK7DyHsh5zud9IPEs=
X-Received: by 2002:a05:6a00:2e9f:b0:628:1e57:afd7 with SMTP id
 fd31-20020a056a002e9f00b006281e57afd7mr10923270pfb.0.1680135478121; Wed, 29
 Mar 2023 17:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <beea645603eccbb045ad9bb777e05a085b91808a.1680108414.git.johannes.thumshirn@wdc.com>
 <3a0f0c92-63cb-3624-c2fe-049a76d1a64a@opensource.wdc.com>
In-Reply-To: <3a0f0c92-63cb-3624-c2fe-049a76d1a64a@opensource.wdc.com>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 29 Mar 2023 17:17:46 -0700
Message-ID: <CAHbLzkoRdTTbnfz3RyLQAeNJBOEVNGL2WLgRSE2eQ4nR8sRe2g@mail.gmail.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 18/19] dm-crypt: check if adding pages
 to clone bio fails
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Song Liu <song@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, David Sterba <dsterba@suse.com>,
 Hannes Reinecke <hare@suse.de>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 4:49=E2=80=AFPM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 3/30/23 02:06, Johannes Thumshirn wrote:
> > Check if adding pages to clone bio fails and if bail out.
>
> Nope. The code retries with direct reclaim until it succeeds. Which is ve=
ry
> suspicious...

It is not related to bio_add_page() failure. It is used to avoid a
race condition when two processes are depleting the mempool
simultaneously.

IIUC I don't think page merge may happen for dm-crypt, so is
__bio_add_page() good enough? I'm working on this code too, using
__bio_add_page() would make my patch easier.

>
> >
> > This way we can mark bio_add_pages as __must_check.
> >
> > Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>
> With the commit message fixed,
>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>
>
> --
> Damien Le Moal
> Western Digital Research
>
>

