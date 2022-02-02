Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 515814A75C1
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Feb 2022 17:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643819230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pS3kT5LVddWR3zmbQIFlkPNpohGuRY/fWsKhJMCt7dc=;
	b=Tbj9Dn1AIP4AFxEazMPgLT7YqV81/qCyx9x1Pt8PdPTLNFjszyGQZucMsRQ1i9RQgjHO2y
	qr4dhzqKgHVhbfzuhivh0y7ac5CToGJHzv5tTbj70ATDktQh1aF7R1e1mRufHNIchH5Fic
	qM/fS6ZsPLNg4x6FVEkk1hhsZFmaB3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-yuzydO3OM8KNNU_YGqlVTw-1; Wed, 02 Feb 2022 11:27:07 -0500
X-MC-Unique: yuzydO3OM8KNNU_YGqlVTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4325814249;
	Wed,  2 Feb 2022 16:27:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C40F170D43;
	Wed,  2 Feb 2022 16:27:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFF381809CB8;
	Wed,  2 Feb 2022 16:27:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 212GR2VJ021850 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 11:27:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 432AA76CD; Wed,  2 Feb 2022 16:27:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E65076C5
	for <cluster-devel@redhat.com>; Wed,  2 Feb 2022 16:26:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69EC7805F4A
	for <cluster-devel@redhat.com>; Wed,  2 Feb 2022 16:26:58 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-372-h7cnwHWdMeamJrb2V2_2Mw-1; Wed, 02 Feb 2022 11:26:57 -0500
X-MC-Unique: h7cnwHWdMeamJrb2V2_2Mw-1
Received: by mail-wr1-f72.google.com with SMTP id
	b3-20020a5d4b83000000b001d676462248so7031142wrt.17
	for <cluster-devel@redhat.com>; Wed, 02 Feb 2022 08:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pS3kT5LVddWR3zmbQIFlkPNpohGuRY/fWsKhJMCt7dc=;
	b=6kXeyHEdqwpSmNFytc34dHUMCptS++IHRBm9oT61Gg+lXpVXnIe89l/8FSgKXPg4Xu
	vB8eN5M9kN5HPklwuvON94VCDPvjtxSW6yMt1JDp+Ivh+xzW7FSj7AOwLuVgvw7XjaWs
	q0cPGBJlT9F3po+W5PkLQzqtske8m49r/HekOMWPtt2/EaSvYkEjx4fUjBlwAhhVhFHD
	UCqYLOTdbJggatpjV9h5Rouc9+ROF6TSUrPF2BwFVQ6l/AFGmV+Iw9dLnfiCzRMDp98x
	6C7GwTcXgIUpkYbMawpXRB1jJM3DoUArVpW3mbm0by3jPGe6yr+cwzy5LgdIsgy2nON1
	irhw==
X-Gm-Message-State: AOAM531Y0YUlgUsQ8SosIT9QZEhO0F+hlIbPSyXK+CkRk1HYfwHNCDD9
	Z/JBNga1BMVQSTzo7BTgCaJpLYtBrUBpoDHO0Rg819+QwmlG3jGFpHJoqpME0GFZ7ym/s6gCXbw
	vdFENrYRJl6dJCBRHTP+1HmGStLRDSVUDAN3RfA==
X-Received: by 2002:a05:6000:1682:: with SMTP id
	y2mr21884880wrd.654.1643819215598; 
	Wed, 02 Feb 2022 08:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd3rdVcRbB4pZWVapBv/BrA29etlGEh5fjYRp9+FAGDUdzqNAgBhhI0OghijEHh8h8+VCeVI9HGWo0ZtKsOCA=
X-Received: by 2002:a05:6000:1682:: with SMTP id
	y2mr21884872wrd.654.1643819215415; 
	Wed, 02 Feb 2022 08:26:55 -0800 (PST)
MIME-Version: 1.0
References: <CAHc6FU6+mr5n8ng=P7hNbJjr=yE5YN9LcDHtD1_B10TudgcF-g@mail.gmail.com>
	<20220124172357.554689-3-rpeterso@redhat.com>
	<20220124172357.554689-1-rpeterso@redhat.com>
	<20220202155529.42634-1-agruenba@redhat.com>
	<cc94a478-e64c-513e-2420-ff0e4eba1db9@redhat.com>
In-Reply-To: <cc94a478-e64c-513e-2420-ff0e4eba1db9@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 2 Feb 2022 17:26:44 +0100
Message-ID: <CAHc6FU4HGAd5ZboCwNsbN25+YnXO3eVmK0o+1dQr0-F5qctF4Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Expect -EBUSY after canceling dlm
	locking requests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 2, 2022 at 5:04 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Looks good. If you push it to a temp branch I'll test it.

The for-next branch fell a bit behind lately, but I've updated it now.

Thanks,
Andreas

