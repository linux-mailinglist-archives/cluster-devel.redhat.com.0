Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50B671C62
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 13:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674045826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DJFKWs0jtm8hl4SVQnbbNh8Row9y5eHKj6s/8aaU3Dc=;
	b=YXNlbHDoW/8tZmVzYP3CKYjiKiwzGLMKE0WmxD+9lLcUjapMqd72RlvQ3jF9lReGq/bXvf
	7xN2t9sEdMdrQ1LghcbBgLletsH7xsL0Q1S5zO3ZFXTwE+kPN82/KL/w4zEv88MgnqbW9L
	zTN0sFPmv5YPae6rIzJ5endneMb3Eb4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-Fj4ly5xLMSy0Sg3TED6yjQ-1; Wed, 18 Jan 2023 07:43:42 -0500
X-MC-Unique: Fj4ly5xLMSy0Sg3TED6yjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DE0E801779;
	Wed, 18 Jan 2023 12:43:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7742026D4B;
	Wed, 18 Jan 2023 12:43:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E4BF51946A6D;
	Wed, 18 Jan 2023 12:43:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E2AD19465B7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 12:39:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E60EC2026D68; Wed, 18 Jan 2023 12:39:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDD22026D4B
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 12:39:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B950C858F0E
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 12:39:28 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-VGTI7ZiKOsK_6nhITvt5tA-1; Wed, 18 Jan 2023 07:39:26 -0500
X-MC-Unique: VGTI7ZiKOsK_6nhITvt5tA-1
Received: by mail-ua1-f43.google.com with SMTP id m17so2604903uap.7
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 04:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJFKWs0jtm8hl4SVQnbbNh8Row9y5eHKj6s/8aaU3Dc=;
 b=mQA/gAmECOufCwmS0dGeuOmuMX4S5m54OH2XHXEux9DcSSJu1hx+OUSI74CDEDHNGi
 XrN1B7m3gT1yQO1qLF0bq7bvrGsRSo/qWAQMmkN/F+o7xDh4suIsNiVf+mM+nsIBAWws
 Oa4tpgSPfUjnOOKbDhkrP4UP77qXYDRPn7Srt1t3c6QYvu3XrMGluHw51pPbivuVGTXq
 /CeW/uuTLcdZrKyVso60f47T12SMc5iMBGTkAi8d3BsJ5F/vjP6ohH7APZQEF1o0P/n7
 VQufp5Gp7S+eVJG+K3fziasq7RN5e5ImljMt80TuDoqM3LGovr7iG9ZDf3dgteAsovpo
 l7Og==
X-Gm-Message-State: AFqh2ko+1+KW6ce6qLhY/fZj7FfjF4DUq6928FLPhTNuEQditoh/xHYM
 LAueDIhgFPbLJe032yNYASL3l63MvyGG1Hb8MQM=
X-Google-Smtp-Source: AMrXdXuYI0XqwMDQVyPl+VYMuyHTTEt0gz5eK89H6wdmtU2BkYDhCb6M0sSqHefS5y6aUxLq2IwbOZgPl/R9bgjDaww=
X-Received: by 2002:ab0:278a:0:b0:5f4:34e9:f5a4 with SMTP id
 t10-20020ab0278a000000b005f434e9f5a4mr745938uap.51.1674045565693; Wed, 18 Jan
 2023 04:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-10-hch@lst.de>
In-Reply-To: <20230118094329.9553-10-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 18 Jan 2023 21:39:08 +0900
Message-ID: <CAKFNMomcjvUSh-nS1MqptYdiT-1frRsmHgx2mHBBm_588kprrQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 9/9] mm: return an ERR_PTR from
 __filemap_get_folio
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 7:41 PM Christoph Hellwig wrote:
>
> Instead of returning NULL for all errors, distinguish between:
>
>  - no entry found and not asked to allocated (-ENOENT)
>  - failed to allocate memory (-ENOMEM)
>  - would block (-EAGAIN)
>
> so that callers don't have to guess the error based on the passed
> in flags.
>
> Also pass through the error through the direct callers:

> filemap_get_folio, filemap_lock_folio filemap_grab_folio
> and filemap_get_incore_folio.

As for the comments describing the return values of these callers,
isn't it necessary to rewrite the value from NULL in case of errors ?

Regards,
Ryusuke Konishi

