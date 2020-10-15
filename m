Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB59C28F533
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Oct 2020 16:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602773411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nBzrhTZ8OcU0XwdoJwv41cg3jgP+wkLcZmhGXxSoEhQ=;
	b=Yatfq+/tItLIQy2S6nKfyxVdXggoMMmFv4VRyXZiWyrk6PhK2SRYy7qSJ+rkwvMBZ/aCSe
	9rkdR2PMMqgPFcD/M0N558ZD1VfxxGHh910SklnfxlAWRWDgPg2ye4ZGU1lqUr65M1vKpW
	bX9BiDMTVX+88UVGdA5O0KaULmubRDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-99vr54MOOVOx7pdmgYDe1w-1; Thu, 15 Oct 2020 10:50:08 -0400
X-MC-Unique: 99vr54MOOVOx7pdmgYDe1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D735018C5206;
	Thu, 15 Oct 2020 14:50:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B57BC5D9D5;
	Thu, 15 Oct 2020 14:50:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E334A5810F;
	Thu, 15 Oct 2020 14:50:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09FEnxpM010893 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Oct 2020 10:49:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5315549C1A; Thu, 15 Oct 2020 14:49:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D24113E409
	for <cluster-devel@redhat.com>; Thu, 15 Oct 2020 14:49:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 856C9811E90
	for <cluster-devel@redhat.com>; Thu, 15 Oct 2020 14:49:56 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-155-F4QOIg2AN-28oCQ4guR-Lg-1; Thu, 15 Oct 2020 10:49:54 -0400
X-MC-Unique: F4QOIg2AN-28oCQ4guR-Lg-1
Received: by mail-wr1-f69.google.com with SMTP id a15so2091914wrx.9
	for <cluster-devel@redhat.com>; Thu, 15 Oct 2020 07:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nBzrhTZ8OcU0XwdoJwv41cg3jgP+wkLcZmhGXxSoEhQ=;
	b=mQmIsv7REHVyR8lObtuV4nfmcc9xHb4136ZNBl0CVX1Tj3GGxHJYL9Ak6g2NbJsa2Q
	Wu3shIQ1UH+vnDiqKXm/1UQcRdoPF+J6szJ+fXks2DFkHb86tR8kQ6rg3YzQSEH93aJY
	l31Ba3UsxQn1MRAXU8KrX+ExKSWS00qVL92SJ9vPPeaLmrQ5zXBeY/NSqLeiat8Q52ix
	j+mPYAgmcXy+hvKw//fNy56kLB7BX6jwHT2ZCTC7SThRHZ9AV9zRW11OxuEaDyxrQ85J
	up2xvXSFitXLWpik9ObLg7UouVKfmR6kBdf4+rTSNRZ4SicnZPxAi8BWM8km4nrb+0Lw
	OgYw==
X-Gm-Message-State: AOAM533obR9IaH85kYyVV4mx1n7T/9VtRyWM0Yk6A+x6n1nXegva30UV
	dzw7mcEmE3jDbXgq3/rMUphXUtw9dXbTEBFTIePBEQiT2Mhn91VtWgXfA93BgmIyWW+w+R4/G3p
	5xEdY+Giz64l05OPKGiXBnrpnLJfMj6ErI3/7Aw==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr5034620wro.357.1602773393336; 
	Thu, 15 Oct 2020 07:49:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaQi1df5IFTqA9daxTqcsG1L7ByUvMhDTlRWhfe3ji6VYEq2lsiHBciR1N6ihxUXi/hdd3bA2981aOzJ1USDA=
X-Received: by 2002:adf:ed52:: with SMTP id u18mr5034612wro.357.1602773393182; 
	Thu, 15 Oct 2020 07:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200925034625.56517-1-adas@redhat.com>
In-Reply-To: <20200925034625.56517-1-adas@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 15 Oct 2020 16:49:41 +0200
Message-ID: <CAHc6FU5uzOrj2X6-Z1qpmCO9KT7xg5GosyEMyyW4oexqZH67fQ@mail.gmail.com>
To: Abhi Das <adas@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v2 0/3] gfs2: local statfs improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Abhi,

On Fri, Sep 25, 2020 at 5:46 AM Abhi Das <adas@redhat.com> wrote:
> This patchset allows gfs2 to sync statfs info from the journal to the
> master statfs file during a log flush or during recovery. We still
> write to the local statfs file to allow older versions to recover the
> statfs info of newer kernels with this patchset.

I can't find any documentation about how the whole statfs mechanism
works in the code, so things that should be documented include:

* How did the statfs mechanism work historically (globally, per
resource group, per node)?
* How did adding statfs information to the journal help?
* How does this patch set improve upon that?

Thanks,
Andreas

