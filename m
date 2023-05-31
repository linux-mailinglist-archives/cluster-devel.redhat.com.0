Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFEC7175F4
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 06:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685509127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Acpk3D0vIaaSq7knQOSMcE5Zt2GM0cFl+HSZygJWetU=;
	b=RrUAc+Frj9BGG0xnK57LBH8lR7jCsAS9Jp2zbKVwFmLn018INmfZExppP7uUB2XPvwsjh+
	cXqAQp9C13UUnpB/eNhMCtFy3hBcEsYZvbvcuGgSisXJN3tok5eLSkpgyLBo1Eq7pWSOLP
	v1u3xA+ANkxzH5kKBNDT1cu9vGz95gk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-FhTD8cGONVOhqkUwqa1dlA-1; Wed, 31 May 2023 00:58:43 -0400
X-MC-Unique: FhTD8cGONVOhqkUwqa1dlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5F47800159;
	Wed, 31 May 2023 04:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03D2340C6EC4;
	Wed, 31 May 2023 04:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95D8619465A8;
	Wed, 31 May 2023 04:58:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 470A91946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 04:58:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3055248205E; Wed, 31 May 2023 04:58:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 285F540C5BE
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 04:58:40 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DFA13801FF1
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 04:58:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-kfooFzeRNz-yHRAeSycghw-1; Wed, 31 May 2023 00:58:35 -0400
X-MC-Unique: kfooFzeRNz-yHRAeSycghw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 139EE636B9;
 Wed, 31 May 2023 04:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD00C433A1;
 Wed, 31 May 2023 04:58:33 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4f4bd608cf4so6134493e87.1; 
 Tue, 30 May 2023 21:58:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDxiYs8eefpYT0qgchcrT3tk3iq30txK1Nn21AAY5cco8UuYKcSK
 onLox+V7Mydm3OP+DyaEwnGOyqO26Jux8P36LVU=
X-Google-Smtp-Source: ACHHUZ7XDiYWJcs+q0AXYFH83FpH+4XZaAkwQNLTh6knjyPLIO1LGIR2Y7lAqiqnrlvTJ8gMp4sK/wzuHD8SIBdPb68=
X-Received: by 2002:a2e:a28f:0:b0:2ad:9acb:4849 with SMTP id
 k15-20020a2ea28f000000b002ad9acb4849mr1778554lja.47.1685509111386; Tue, 30
 May 2023 21:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
 <c60c6f46b70c96b528b6c4746918ea87c2a01473.1685461490.git.johannes.thumshirn@wdc.com>
 <20230531042502.GM32705@lst.de>
In-Reply-To: <20230531042502.GM32705@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 30 May 2023 21:58:19 -0700
X-Gmail-Original-Message-ID: <CAPhsuW62vBccjUkCUmYr+OZSLgGozFzX4YyzP8OV+dvsLujCGg@mail.gmail.com>
Message-ID: <CAPhsuW62vBccjUkCUmYr+OZSLgGozFzX4YyzP8OV+dvsLujCGg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v6 15/20] md: raid1: check if adding
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, gouhao@uniontech.com,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 9:25=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> To me these look like __bio_add_page candidates, but I guess Song
> preferred it this way?  It'll add a bit pointless boilerplate code,
> but I'm ok with that.

We had some discussion on this in v2, and decided to keep these
assert-like WARN_ON().

Thanks,
Song

