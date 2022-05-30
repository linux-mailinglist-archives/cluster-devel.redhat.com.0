Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D70C85383DE
	for <lists+cluster-devel@lfdr.de>; Mon, 30 May 2022 17:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653923538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DocoDhMbl7SFpv7NBU8vBbTeJZmjvJVDL7oASpJRA9A=;
	b=ENar32vATFd3jbKacrl4fTwsccMr7eEaxUMMVP/e87gyAaUoeaDWqG11NjfdSJ4CuSPi7Z
	hAZsDdjEI9bZ0WH6gLo31V8iAnIvvKGp2JQqtJjyvQoRebmp2yLTGdTkt2esx8k42DpqYP
	IuY/Yc88xPYmZoEwtd/Ahel/SDN8g2o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-KJ-fiyoeOg6CjAxNc9DB1A-1; Mon, 30 May 2022 11:12:13 -0400
X-MC-Unique: KJ-fiyoeOg6CjAxNc9DB1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25727101AA4D;
	Mon, 30 May 2022 15:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E389E2026D64;
	Mon, 30 May 2022 15:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B73B61947056;
	Mon, 30 May 2022 15:12:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4246819466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 May 2022 15:12:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12CFA492CA3; Mon, 30 May 2022 15:12:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FA62492C3B
 for <cluster-devel@redhat.com>; Mon, 30 May 2022 15:12:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB23F2809CA4
 for <cluster-devel@redhat.com>; Mon, 30 May 2022 15:12:10 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-41VQldkJNPOZrRRdGRKeHQ-1; Mon, 30 May 2022 11:12:09 -0400
X-MC-Unique: 41VQldkJNPOZrRRdGRKeHQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 ee9-20020a0562140a4900b00464376ffe2aso4445789qvb.18
 for <cluster-devel@redhat.com>; Mon, 30 May 2022 08:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DocoDhMbl7SFpv7NBU8vBbTeJZmjvJVDL7oASpJRA9A=;
 b=o9eDJNS2hbJ/VVf6evPMnpW60AGtiGqYOJptMwnkTSunrtEtRW+MlNLPJxlBcKJOaF
 YZBOwSfuVBWe4DtTaLtiDCwYsecb5M+0ZScGdsQFp6WvszoPugs0bG73nvAK3E2vPG//
 xkXDj3vuMw9V90ayLKu0yo2SadLW+sgZyvq2M6UBooIbpJ+x7Vfoh8LIPfjkTg7JKk+h
 /zZSlyz1ic+G3jscmJLXt/pCkFkcc4KMti6bD8tovSIIrne5PW7d5Eiw9U9+EaIrAcMT
 /5v3NRHCQ53Cv/LQ8t+vnDnAbutZKO8YeNdJi0NHUdh15UqWrBAzJ0sTlUIBWZZ6YDk2
 dfcg==
X-Gm-Message-State: AOAM533SsAOdFrgLCD+rwLz56YrKcbv3ZJ0XuB2Ju46XwZXljoA1Mt2H
 Xxy/zPAhXcXC69z4n+kCDcZfmIgEJ2+coX8kW6k67YuHfHTK76GRAAHzoBNk4pazya/Oov/Urun
 17gpgi6sja8zwvgKwLbj7w6smR4hT8XhGxUL8zA==
X-Received: by 2002:ac8:5c16:0:b0:302:c9c6:c979 with SMTP id
 i22-20020ac85c16000000b00302c9c6c979mr5785922qti.123.1653923529127; 
 Mon, 30 May 2022 08:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwayHZRJCs37y6j6TIL4WhMopZzbSpyxbCNbE7NOYKFseReLvKWtOUg+xi91aGliEuOHffypWrUHkpATEF92dk=
X-Received: by 2002:ac8:5c16:0:b0:302:c9c6:c979 with SMTP id
 i22-20020ac85c16000000b00302c9c6c979mr5785905qti.123.1653923528924; Mon, 30
 May 2022 08:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220530145528.1264681-1-aahringo@redhat.com>
 <20220530145528.1264681-3-aahringo@redhat.com>
In-Reply-To: <20220530145528.1264681-3-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 30 May 2022 11:11:58 -0400
Message-ID: <CAK-6q+ifVsSUvfJdLB+LH1LFbjQkOYh5L_RyJVFRU771HjuT2g@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: add resource name
 to tracepoints
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, May 30, 2022 at 10:55 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds the resource name to dlm tracepoints. In case of
> dlm_lock() we might end in a short time situation (if flags is not
> convert) that a lkb is not associated with a resource at the time
> when the tracepoint is called. Therefore we have a a prioritzation of
> getting the resource name. If the resource in a lkb isn't set we use the
> name and namelen passed as parameter as fallback.
>
> The dlm resource name can be decoded as a string representated ascii
> codec. DLM itself stores the name with as a null terminated array but
> the user does not required to pass a null terminated resource name. To
> have somehow a similar behaviour and the user knows that the resource
> name of the dlm user is ascii codec we store the resource name array in
> a null terminated array but pass the array length for the trace user
> without the null terminated byte. The advantage here is that the user
> can run directly a printf() on the resource name array with a optional
> check on isascii().
>
> The TP_printk() call however use always a hexadecimal string
> representation for the resource name array.
>

I forgot to mention here to say something about the rsb lock and
refcount. Regarding the refcount it's stimple, if it's associated with
a lkb, it can't be freed at this time... and the rsb lock, we access
the name here only and I think this should never be changed.

- Alex

