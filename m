Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A65611C55
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Oct 2022 23:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666991886;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CCE5W/p25lUeQ1tARMSszMQTPv53L4H7LX0+ue0DKyI=;
	b=ho8xpcP2fV5bFIbhJfmImfC41RRaFKfkF+x+epuhZ1B5fUy0VfwWx30p2Q9YfQTuAeJlhE
	T1d3oF8lv+H6Iht3aRhcUP0yRqt8q029r9n8D+smXB1+q1kpXwIql+2MGlQbzyfWM9yYmB
	6FaqSjHce6/g6ZrbPQkvf/IFVY5qkNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-_17PIGkXMSqK0DEfcRupRQ-1; Fri, 28 Oct 2022 17:18:02 -0400
X-MC-Unique: _17PIGkXMSqK0DEfcRupRQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D701185A78B;
	Fri, 28 Oct 2022 21:18:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BCC0492B1E;
	Fri, 28 Oct 2022 21:17:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11F2419466DF;
	Fri, 28 Oct 2022 21:17:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 91E071946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 21:17:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D92E1410F36; Fri, 28 Oct 2022 21:17:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45E1B1401C23
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 21:17:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2778D886461
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 21:17:54 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-G7TrII4_PrapR9QiDIGMQw-1; Fri, 28 Oct 2022 17:17:52 -0400
X-MC-Unique: G7TrII4_PrapR9QiDIGMQw-1
Received: by mail-ed1-f71.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so4071353ede.1
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 14:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CCE5W/p25lUeQ1tARMSszMQTPv53L4H7LX0+ue0DKyI=;
 b=J6HbnE1xB5VgKro/3l6ppfqw0HuwNy3P8yN7kfAjfg+AgFOAegukhmmi3ChyU++knY
 B8KB5A2jYvw+2/aYVAPcQeNXrgPfeJ2UWUtymAJtOeYpU+QaNWIP5iZ0HTzj3hS/Fhfx
 x/BU/I7HddxvjiHl5ZcE67ZNOJ1TGVPFmVzrD5y+x23ITeFtxLtlqsbCDic91ea2EqkD
 hLhg9Nfz27zwC8VLVIjkS9gzerNQMDnEmzOA5DlU0BxTlHw8tb2KWvV17bYo0pTpK0a6
 i1JXXHf9aCsHgshBaxAzBQCgbFHFlXicqTex0nEs8Mvgg0yUogfrscZ7zHwflGP6McSX
 2K9g==
X-Gm-Message-State: ACrzQf25jeLP7kAII+jUmg+WsV8uiUUIfk5P16bSHE+KjA7PT2BvG//2
 JjHjU1F4UVViBQmOWLNDTbBYG0KqlE/or5RmtMk9CalI4bSatHdsfntxixOhuAg+EFVA9S4m5T4
 aueVwgRL1oSeo48CPknLAXzyvqRoexcTBz3H+SA==
X-Received: by 2002:a17:907:80d:b0:73d:1e3f:3d83 with SMTP id
 wv13-20020a170907080d00b0073d1e3f3d83mr1149576ejb.372.1666991871565; 
 Fri, 28 Oct 2022 14:17:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Nw6zGzKPJuIqtbU/RNCMbb3/d2MlIeCEzOM1r7lqialLrVQbvSGwnfK9WAO2QxQJIcvZUwXLGi/U4es424iY=
X-Received: by 2002:a17:907:80d:b0:73d:1e3f:3d83 with SMTP id
 wv13-20020a170907080d00b0073d1e3f3d83mr1149569ejb.372.1666991871408; Fri, 28
 Oct 2022 14:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221027204528.1119036-1-aahringo@redhat.com>
 <20221027204528.1119036-11-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-11-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 28 Oct 2022 17:17:40 -0400
Message-ID: <CAK-6q+iyL40xzADk_R6EcB5pLLrbX590yR_Y52WVboKY7zVt9w@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v6.1-rc1 11/18] fs: dlm: use a
 non-static queue for callbacks
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Oct 27, 2022 at 4:45 PM Alexander Aring <aahringo@redhat.com> wrote:
...
> +
> +       /* TODO */
> +       lkb->lkb_flags &= ~DLM_IFL_NEED_SCHED;

sorry, I think I put a TODO there because I wanted to rename this flag
with DLM_IFL_CB_PENDING.

- Alex

