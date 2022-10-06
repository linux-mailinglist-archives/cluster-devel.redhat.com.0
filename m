Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D910F5F6B1D
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Oct 2022 18:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665072106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wsE1ZyhqacM9VGP7OEb6uTfrVzi9GE2Jff3WghHVyrE=;
	b=YJ53G6njjIf0poOnY40GeurLs2xSItWAHBUkYKL3EOYzVy47ZW2V/1AGK5m1U/uDeTZwAi
	FuSObZ6pUn+DaZOav8XY40xvXqws03fJvPkQ/rsAgiuWGwfvVf1OVjjQPFAdZqkVrF2g36
	2Nk9UTgyJgS76UwWBANLtEK2Lqpob98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-S1nEVNiEMHK8N48mjAr9Aw-1; Thu, 06 Oct 2022 12:01:43 -0400
X-MC-Unique: S1nEVNiEMHK8N48mjAr9Aw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D951F185A7A3;
	Thu,  6 Oct 2022 16:01:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC663422A9;
	Thu,  6 Oct 2022 16:01:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F4D519465B9;
	Thu,  6 Oct 2022 16:01:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 115FB1946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Oct 2022 16:01:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 03BB41121320; Thu,  6 Oct 2022 16:01:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1263112132E
 for <cluster-devel@redhat.com>; Thu,  6 Oct 2022 16:01:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFAAC803520
 for <cluster-devel@redhat.com>; Thu,  6 Oct 2022 16:01:40 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-0FJrHlRHO_SDHOQUhUUXCQ-1; Thu, 06 Oct 2022 12:01:39 -0400
X-MC-Unique: 0FJrHlRHO_SDHOQUhUUXCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h126-20020a1c2184000000b003c07570f7aeso1924787wmh.3
 for <cluster-devel@redhat.com>; Thu, 06 Oct 2022 09:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wsE1ZyhqacM9VGP7OEb6uTfrVzi9GE2Jff3WghHVyrE=;
 b=kOnnhK3gJOVAiAiZoS/EiaNSERLdUqPsGjf4p3N8vrY4g4+RdXXo9T78ySP5W9r+IJ
 iHbKfXbPapwnb7AgQMfgD4vKCDHiyOS3qg46GcD+C+Hhn6RwDdulq5aRvZH8/J6voiM9
 ZYplNmlomLqG2duMrs0o/45fdlLFJtineIfGAxaMcTB8OcScxww5JgMEv6Tkiex9DIDp
 4SR88FUvDp2qlwfBZg+w26bgmkkN3UT2K0AlLPJgg/jd6JYjWGZJmsrC6vSHB7zyDbMq
 xv3HLoBsc3U97SVR4yXgiObzFZhmg1ArqFINQehc2MAZM6BgRg0BtYpfa/nAvgY+mfdO
 3ERA==
X-Gm-Message-State: ACrzQf3ePEK/sIvlgfZbu4gOyeOHI/fPJ5GL/Cr4mhx47uixRQxfFjn9
 bRMt5tEdxZf+C4MhfOuQuF87QXmCJJ+SUwDRwrRITs0c683ojGDgELKtDYXtv+3O/mPDSVA1sSQ
 G6iJDTX58i3nEhyVO3brLVvJXuLLiRjYSNGxyxw==
X-Received: by 2002:adf:d203:0:b0:22d:e4f5:5301 with SMTP id
 j3-20020adfd203000000b0022de4f55301mr450055wrh.88.1665072097113; 
 Thu, 06 Oct 2022 09:01:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4RF6sU1NsYTzVnc1f9RwSuoroyCaqbrXLrE5j72BE8O6RXa6u6gQBWN8ILGKV1PbeBh6CMmZO9KS8kmi8QGlM=
X-Received: by 2002:adf:d203:0:b0:22d:e4f5:5301 with SMTP id
 j3-20020adfd203000000b0022de4f55301mr450042wrh.88.1665072096909; Thu, 06 Oct
 2022 09:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221006155606.687350-1-aahringo@redhat.com>
 <20221006155606.687350-2-aahringo@redhat.com>
In-Reply-To: <20221006155606.687350-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 6 Oct 2022 12:01:25 -0400
Message-ID: <CAK-6q+j+pr7oYGYPCmtCFW4ALOXVY+8eOC=8LMp3vd2y4ByX_g@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: relax sending to
 allow receiving
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Oct 6, 2022 at 11:56 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch drops additionally the sock_mutex when there is a sending
> message burst. Since we have acknowledge handling we free sending
> buffers only when we receive an ack back, but if we are stuck in
> send_to_sock() looping because dlm sends a lot of messages and we never
> leave the loop the sending buffer will up very quickly. We can't receive

fill up*

- Alex

