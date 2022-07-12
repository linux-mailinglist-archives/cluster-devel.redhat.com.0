Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A2457119F
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Jul 2022 06:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657601856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tZlZyXpGA2d7F+64fmfQddu741/3is2drypW3hBZwV8=;
	b=EZ4A2pEjabAP4ssYgt/Kq6CFkQ56DFwLExIGQJ8z6EqkkWwMtxmgwjvFD8Jj2PoIhPXtZ3
	aryAKPPdXzBG3rtet4ydmCmaTFOJ8YaARX5DQXsSBjB8PfJvHs4nwC3NHF1DudmJZNVh//
	7nKRkRDzVd+Poac6IpUO1NoPp7tQ5c0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-tCM5POByPNSdMdVaEMeoPg-1; Tue, 12 Jul 2022 00:57:31 -0400
X-MC-Unique: tCM5POByPNSdMdVaEMeoPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 697D93C0F36B;
	Tue, 12 Jul 2022 04:57:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22EE91121314;
	Tue, 12 Jul 2022 04:57:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5B23194705E;
	Tue, 12 Jul 2022 04:57:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 563ED194704A for <cluster-devel@listman.corp.redhat.com>;
 Tue, 12 Jul 2022 04:57:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 433BB401473; Tue, 12 Jul 2022 04:57:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F38E401E54
 for <cluster-devel@redhat.com>; Tue, 12 Jul 2022 04:57:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A4FA2813D27
 for <cluster-devel@redhat.com>; Tue, 12 Jul 2022 04:57:26 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-je7wK3RMN7e35gi-x-aEZg-1; Tue, 12 Jul 2022 00:57:23 -0400
X-MC-Unique: je7wK3RMN7e35gi-x-aEZg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 38CBF68AA6; Tue, 12 Jul 2022 06:57:19 +0200 (CEST)
Date: Tue, 12 Jul 2022 06:57:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <20220712045719.GA4705@lst.de>
References: <20220711041459.1062583-1-hch@lst.de>
 <20220711041459.1062583-3-hch@lst.de>
 <CAHpGcMLFwN4toB2KD0EvPAgx3zchpGNfzUWfsJ-8dxmnOieCsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMLFwN4toB2KD0EvPAgx3zchpGNfzUWfsJ-8dxmnOieCsQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 2/4] gfs2: remove ->writepage
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 cluster-devel <cluster-devel@redhat.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 01:22:48AM +0200, Andreas Gr=FCnbacher wrote:
> It should be possible to remove the .writepage operation in
> gfs2_jdata_aops as well, but I must be overlooking something because
> that actually breaks things.

We'll need to wire up ->migratepage for it first to not lose any memory
migration functinality.  But yes, the plan is to eventually kill off
->writepage.  If I can get you to look into gfs2_jdata_aops,
gfs2_meta_aops and gfs2_rgrp_aops, that would be awesome.

