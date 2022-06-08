Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073D543824
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jun 2022 17:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654703672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=USUlEZ1UMdOAkVgNJKy6bNhyk03F1F+22jSwcfgVGi0=;
	b=gcERjYVCxO0HyHdVWf4RHOuP8Ezw20q3t4b5VWsJNh+Po0sdSIusBkPtpzKZ1SFZ9KfHR3
	obxDXxrR1L/GAOoUQEhYPS7wwLb8S5xj0bo1DE9ilX8Lk9c5rr5jMZtQojCZTICk9WJtaR
	O1M7yUmtZ6QCArQ1IINlobw2AkquTw8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-0t6JjEOqMsaTFUkypgW7mA-1; Wed, 08 Jun 2022 11:54:26 -0400
X-MC-Unique: 0t6JjEOqMsaTFUkypgW7mA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 492E01C05AA3;
	Wed,  8 Jun 2022 15:54:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7C891121315;
	Wed,  8 Jun 2022 15:54:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AA61B1947058;
	Wed,  8 Jun 2022 15:54:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2ACA91947040 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  8 Jun 2022 13:06:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C4E4C28119; Wed,  8 Jun 2022 13:06:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08AA7C28112
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 13:06:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E518085A584
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 13:06:22 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-0vh5xozENVioWaAJs_1BgQ-1; Wed, 08 Jun 2022 09:06:21 -0400
X-MC-Unique: 0vh5xozENVioWaAJs_1BgQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 u2-20020ac80502000000b002f94701339eso16280461qtg.13
 for <cluster-devel@redhat.com>; Wed, 08 Jun 2022 06:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=USUlEZ1UMdOAkVgNJKy6bNhyk03F1F+22jSwcfgVGi0=;
 b=OBpRtjQi2M9oKkDJM/b23rrH8PkZxpqY3m827QnoPXzhVhTsmN72avd6oZM7M3qvNP
 tSjGlXvgBXLpPTR2cPhVE9xzzgtKMvnNpTSylD3PmPQvq89oJ+9aH5EQcdGrQ1qujGOL
 33NjvnewvYGV6ICXKR/xzfB6nFF9S/ZUURMYqxACabtvbtVww8xXEvX4dcJF30k2udYY
 cQAmA8eQsOefIWDEzzk5DkvgaghyU9jHe18QkUEyxq4PyL1Ym710iovIX0YWsTuS8fbD
 DG+pNbmS9a+pT6w4RYCEtZ2Fa5/fFUL8DTVF20xarD25EDkQbr185+AYl47J49NAYtJo
 EXDA==
X-Gm-Message-State: AOAM532DhW2KtqGVFFA5xIkvYq7yrkwDVMk10io829GWNu8uTD7+WReL
 Jh6E0BwutJEmBLNyiNWOyHv7pXdekqh+2d4UxokvrgOeWAkiBPPYKU51YqYN63XH1295IfnKTmZ
 CcSivBTypZKSutBHAMuI7ZQ==
X-Received: by 2002:a05:622a:1013:b0:305:3c:232e with SMTP id
 d19-20020a05622a101300b00305003c232emr2957091qte.180.1654693580925; 
 Wed, 08 Jun 2022 06:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmMXLqnBI6Og+4P0GHsdMp3mdyP17UTS82rMH1Kp6fTALPnxZvoiZs7I0UncTVXHO0B2TwhQ==
X-Received: by 2002:a05:622a:1013:b0:305:3c:232e with SMTP id
 d19-20020a05622a101300b00305003c232emr2957043qte.180.1654693580507; 
 Wed, 08 Jun 2022 06:06:20 -0700 (PDT)
Received: from optiplex-fbsd (c-73-182-255-193.hsd1.nh.comcast.net.
 [73.182.255.193]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05620a440a00b0069fc13ce217sm4216712qkp.72.2022.06.08.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 06:06:20 -0700 (PDT)
Date: Wed, 8 Jun 2022 09:06:17 -0400
From: Rafael Aquini <aquini@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <YqCeyZO77Oi1wvxt@optiplex-fbsd>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-16-willy@infradead.org>
 <e4d017a4-556d-bb5f-9830-a8843591bc8d@redhat.com>
 <Yp9fj/Si2qyb61Y3@casper.infradead.org>
 <Yp+lU55H4igaV3pB@casper.infradead.org>
 <36cc5e2b-b768-ce1c-fa30-72a932587289@redhat.com>
MIME-Version: 1.0
In-Reply-To: <36cc5e2b-b768-ce1c-fa30-72a932587289@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Wed, 08 Jun 2022 15:52:04 +0000
Subject: Re: [Cluster-devel] [PATCH 15/20] balloon: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 Minchan Kim <minchan@kernel.org>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 08, 2022 at 11:59:31AM +0200, David Hildenbrand wrote:
> On 07.06.22 21:21, Matthew Wilcox wrote:
> > On Tue, Jun 07, 2022 at 03:24:15PM +0100, Matthew Wilcox wrote:
> >> On Tue, Jun 07, 2022 at 09:36:21AM +0200, David Hildenbrand wrote:
> >>> On 06.06.22 22:40, Matthew Wilcox (Oracle) wrote:
> >>>>  const struct address_space_operations balloon_aops = {
> >>>> -	.migratepage = balloon_page_migrate,
> >>>> +	.migrate_folio = balloon_migrate_folio,
> >>>>  	.isolate_page = balloon_page_isolate,
> >>>>  	.putback_page = balloon_page_putback,
> >>>>  };
> >>>
> >>> I assume you're working on conversion of the other callbacks as well,
> >>> because otherwise, this ends up looking a bit inconsistent and confusing :)
> >>
> >> My intention was to finish converting aops for the next merge window.
> >>
> >> However, it seems to me that we goofed back in 2016 by merging
> >> commit bda807d44454.  isolate_page() and putback_page() should
> >> never have been part of address_space_operations.
> >>
> >> I'm about to embark on creating a new migrate_operations struct
> >> for drivers to use that contains only isolate/putback/migrate.
> >> No filesystem uses isolate/putback, so those can just be deleted.
> >> Both migrate_operations & address_space_operations will contain a
> >> migrate callback.
> 
> That makes sense to me. I wonder if there was a design
> decision/discussion behind that. CCing Rafael.
>

None that I recollect. If memory still serves me, I think the idea behind
bda807d44454 and friends was to provide a generic way to allow page
mobility for drivers without adding complexity to the page isolation / putback
paths, and since the migration callback was already part of the aops struct
those new callbacks just followed suit.


-- Rafael

