Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C14F835A83C
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 23:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618002682;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=B+A9UQcNZ7UypIVwyC7KFwmEqtSkkbnW2NvV4M5E2gI=;
	b=PKCksWULSd5IT+dvr/A7M5RE1HIJOwRZcF9Gd2rtep4q8LkMzMxjDqVI3jTn7Ms9B+zvfA
	fbDC/OAIlp+ERaEPcOoEUNfrMAcewEJfGR41/9AMxkZkZivyMmbPZS4eVSkfS3zSUwNfra
	25np5I5EA1q83JVklNqXoPeqSogg9So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-C8MRIB9cMeyip_tDjCBaDQ-1; Fri, 09 Apr 2021 17:11:21 -0400
X-MC-Unique: C8MRIB9cMeyip_tDjCBaDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38C22107ACCA;
	Fri,  9 Apr 2021 21:11:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EABA25C5E0;
	Fri,  9 Apr 2021 21:11:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C66B1806D0F;
	Fri,  9 Apr 2021 21:11:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139LBF0p030258 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 17:11:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4254E219B8A0; Fri,  9 Apr 2021 21:11:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D82C219B89F
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 21:11:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60A3C101A52C
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 21:11:12 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-FjDxEHQAMHaLTGiHZY8SDQ-1; Fri, 09 Apr 2021 17:11:10 -0400
X-MC-Unique: FjDxEHQAMHaLTGiHZY8SDQ-1
Received: by mail-wr1-f69.google.com with SMTP id m13so2813720wri.16
	for <cluster-devel@redhat.com>; Fri, 09 Apr 2021 14:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=B+A9UQcNZ7UypIVwyC7KFwmEqtSkkbnW2NvV4M5E2gI=;
	b=ccOzfRhC0J2NspFrBkbZLqrQYEs2SnaPGMOGuSKcj0rTkwb1jJ6DlUqoH8JhsWhacV
	s0lq/1wAC/VDslfCGrJnJSaLmMT4REkKZdgPJ2j/3N5S1B9/lrCtFmX8LFG7YEUBBHMw
	zfNp7ZXpqegTcBu2sHhGDnr+fECF4RdzhegrEy15A3PKCE8wFW0ezmehdf2r3M/3Ltzs
	0mOugICl8dnC7nyU2wguiQz1xGfw896Dion7m9lA18WoDgG2M6/cFAS5kUzsqoRCaQ5p
	jXFYRx+yUylz1PhKHLA6jkwWRKSeRHkWVM/+41eN8SvDw77JeIjl6OKqgmDtttRPQiV8
	bMcA==
X-Gm-Message-State: AOAM530WCsBcpeLaJJrlogKf+r7IhbUVNfMNQh1ffbmvbhbBh3fs8BHS
	luzKEEMA0iLYkK1UWb7dA5ILuApo+3bKgEpBO/70o2w2nn+MqUYvnVJykkhhENPpeRL4HInO7K4
	+orq3xkowGW1kzBvthQxQtQ==
X-Received: by 2002:adf:c10a:: with SMTP id r10mr20225013wre.40.1618002669491; 
	Fri, 09 Apr 2021 14:11:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrCx+94wPF2xdaeQ3FVEk0NedfImhrHeWX5YW41XEHBCbeluNs7y6S6PmdU3WPqO8KWYaO1w==
X-Received: by 2002:adf:c10a:: with SMTP id r10mr20225004wre.40.1618002669394; 
	Fri, 09 Apr 2021 14:11:09 -0700 (PDT)
Received: from linux-2.home
	(2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr.
	[2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
	by smtp.gmail.com with ESMTPSA id
	s13sm6399813wrv.80.2021.04.09.14.11.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Apr 2021 14:11:09 -0700 (PDT)
Date: Fri, 9 Apr 2021 23:11:07 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Alexander Ahring Oder Aring <aahringo@redhat.com>
Message-ID: <20210409211107.GD30244@linux-2.home>
References: <20210326173337.44231-1-aahringo@redhat.com>
	<20210326173337.44231-8-aahringo@redhat.com>
	<20210402205351.GA24027@linux-2.home>
	<CAK-6q+hnj94xQS+QceDF3GyDR78ns61-T1UVLs7o6kJsPzT=Fw@mail.gmail.com>
	<CAK-6q+giMt8HUg5jY0msrKGazUeRnGNqC6nNPqNa2Mca8NRCuQ@mail.gmail.com>
	<CAK-6q+i5YmXV_NkwCGerPfNTjCE=or626Refuz_7CQDRhrJj1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK-6q+i5YmXV_NkwCGerPfNTjCE=or626Refuz_7CQDRhrJj1A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [Cluster-devel] [PATCHv3 dlm/next 7/8] fs: dlm: add reliable
 connection if reconnect
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 05, 2021 at 04:29:10PM -0400, Alexander Ahring Oder Aring wrote:
> Hi,
> 
> On Mon, Apr 5, 2021 at 1:33 PM Alexander Ahring Oder Aring
> <aahringo@redhat.com> wrote:
> >
> > Hi,
> >
> > On Sat, Apr 3, 2021 at 11:34 AM Alexander Ahring Oder Aring
> > <aahringo@redhat.com> wrote:
> > >
> > ...
> > >
> > > > It seems to me that the only time DLM might need to retransmit data, is
> > > > when recovering from a connection failure. So why can't we just resend
> > > > unacknowledged data at reconnection time? That'd probably simplify the
> > > > code a lot (no need to maintain a retransmission timeout on TX, no need
> > > > to handle sequence numbers that are in the future on RX).
> > > >
> > >
> > > I can try to remove the timer, timeout and do the above approach to
> > > retransmit at reconnect. Then I test it again and I will report back
> > > to see if it works or why we have other problems.
> > >
> >
> > I have an implementation of this running and so far I don't see any problems.
> 
> There is a problem but it's related to the behaviour how reconnections
> are triggered. The whole communication can be stuck because the send()
> triggers a reconnection if not connected anymore. Before, the timer
> was triggering some send() and this was triggering a reconnection in a
> periodic way. Therefore we never had any stuck situation where nobody
> was sending anything anymore. It's a rare case but I am currently
> running into it. However I think I need to change how the
> reconnections are triggered with some "forever periodic try" which
> should solve this issue.

Would it be sufficient to detect socket errors to avoid this problem?
For example by letting lowcomms_error_report() do the reconnection when
necessary?

> 
> - Alex
> 

