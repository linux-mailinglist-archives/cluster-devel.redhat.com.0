Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248555772E
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 11:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655978125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LcK/ElvToq/GKGaUTeOWlSYLGB2z7CGdZ3c0oLrfcZU=;
	b=cnualZCcI4WtuGisIPsPz58fxrVie2xp5qoaxLYv9/7ZxA4aZznHZKJb9wgm97g4zUxu+A
	alOZjOHLttBn4M9uvoQOnFUC+GbackWpYvBSBFm4ivm6JL4xOudXRIa9oxF6Dg0j7aqib7
	7RdZso7F5AJjAireiJUVWbvRqDDzRSs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-8tyKIfNtMZOUFDkLJF2w9g-1; Thu, 23 Jun 2022 05:55:22 -0400
X-MC-Unique: 8tyKIfNtMZOUFDkLJF2w9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9542801231;
	Thu, 23 Jun 2022 09:55:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8897C2811A;
	Thu, 23 Jun 2022 09:55:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 08CDF194B950;
	Thu, 23 Jun 2022 09:55:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37ADE1947063 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 09:55:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29ED72026D07; Thu, 23 Jun 2022 09:55:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 264912026D64
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 09:55:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A9C2294EDCF
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 09:55:20 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-ihr15ap7OfOLYV0XuHN_HA-1; Thu, 23 Jun 2022 05:55:18 -0400
X-MC-Unique: ihr15ap7OfOLYV0XuHN_HA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n35-20020a05600c3ba300b003a02d7bd5caso1182459wms.2
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 02:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LcK/ElvToq/GKGaUTeOWlSYLGB2z7CGdZ3c0oLrfcZU=;
 b=UadXOKkWSTvFQBf9Wdn+PuzdpmZHBuZfT5t4hJJvdyAwQ/Evtxpn1VoqgzDu6GVwCg
 7EgLO5GjK/fTBFKyLm3PKezKrDYO7sA0LxPV8jqP5y+sM/LYvvcgPcUuZyCWfApLN/JZ
 QqDZTV4f4VMgYZjLT3klFZYrHyst9Om9eXVPqjgNfmquAcBZn8JCMKAIyJeXLW4bwAay
 bt2m03yz7xlLO3uDDuaoJXr6xEm7hmqZ7hS2ivJ7Q8hDvx+oypZ76Veov8mzpEs92JuW
 RkWxl8Zl2JuSD/LheTlVCdEftdc1Zy49CZ6Qe7Y9wejmTqZxoCSVTOUcJSs+QCm+yJcW
 aOFg==
X-Gm-Message-State: AJIora+840MhYm1Yq/lB082N5qULVDIgrOgZpfnS5POSLvESFwERrcy6
 E1DmJm7VF5T9oK+CyIAnyGmKftT8GSsBMsxfOpsp5mr2Iug3NymVzfUXEqp65ACgydIehhwnXnD
 eS0XJLquD8hJeHEp+EfLHuJ6kLdc7/TDHbF2kZw==
X-Received: by 2002:a7b:c4ce:0:b0:3a0:2ac4:3233 with SMTP id
 g14-20020a7bc4ce000000b003a02ac43233mr3167193wmk.92.1655978117407; 
 Thu, 23 Jun 2022 02:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWWfknRvDP524lHe6dlXZBJVCYmj0zoYe2ybjVKioiQLsF7GQ7KgpdkDjinkKIxuFs8fmriuxQO2+bQbrXoaE=
X-Received: by 2002:a7b:c4ce:0:b0:3a0:2ac4:3233 with SMTP id
 g14-20020a7bc4ce000000b003a02ac43233mr3167181wmk.92.1655978117238; Thu, 23
 Jun 2022 02:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220623093716.13338-1-jiaming@nfschina.com>
In-Reply-To: <20220623093716.13338-1-jiaming@nfschina.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 23 Jun 2022 11:55:06 +0200
Message-ID: <CAHc6FU5h+QDHgvNupAmjsnhKDCAXCpdy-3x8Qk-x3qwLMWvwZQ@mail.gmail.com>
To: Zhang Jiaming <jiaming@nfschina.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix spelling mistake
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
Cc: cluster-devel <cluster-devel@redhat.com>, liqiong@nfschina.com,
 renyu@nfschina.com, LKML <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 23, 2022 at 11:41 AM Zhang Jiaming <jiaming@nfschina.com> wrote:
> Change 'accomodate' to 'accommodate'.

Applied, thanks.

Andreas

