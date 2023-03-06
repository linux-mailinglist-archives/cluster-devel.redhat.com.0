Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2BA6ABFCF
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 13:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678106844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8txTUjCfQ30DZq8EG3/E5KSXjGhKnOOc6WZNsN31Luc=;
	b=TDTLAoXK6TrKIOF61aRvWamNpBIbPXhGrN0xstVd1zGa8C4Tm8BH5SdBtveuBsjZ4JI4rn
	DE6LqULoO7H2zvQfkLJrHK6gU3xSOEnBm87E03fJ08dhMCVW5oH7CAl4WgeiisdYnLseGf
	obtAvhRrggsEzRZq+kNH1D9r7DSlg0c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-KqhFajOjMribdXre4EGgAA-1; Mon, 06 Mar 2023 07:47:21 -0500
X-MC-Unique: KqhFajOjMribdXre4EGgAA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D2AA18A6462;
	Mon,  6 Mar 2023 12:47:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F46A492C3E;
	Mon,  6 Mar 2023 12:47:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3E86E194658F;
	Mon,  6 Mar 2023 12:47:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C62721946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 12:47:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7254C2026D76; Mon,  6 Mar 2023 12:47:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B2A82026D4B
 for <cluster-devel@redhat.com>; Mon,  6 Mar 2023 12:47:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BC7285D185
 for <cluster-devel@redhat.com>; Mon,  6 Mar 2023 12:47:17 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-Li83eDWYNR60VY7w0S6xKg-1; Mon, 06 Mar 2023 07:47:15 -0500
X-MC-Unique: Li83eDWYNR60VY7w0S6xKg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w11-20020a05640234cb00b004b3247589b3so13891306edc.23
 for <cluster-devel@redhat.com>; Mon, 06 Mar 2023 04:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678106834;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8txTUjCfQ30DZq8EG3/E5KSXjGhKnOOc6WZNsN31Luc=;
 b=yVFJcN6wfgM8bEJb/SNjfDax3oNSpd00S0RiJzvC/34Zby3d3NTG+m9wzW8bxbj6ce
 /KShsbxHJUsFngLTQ+eY7PcbJfD2uft0dbg/ObmxaCij+mRPpMrrTm/DAmFVBCS6LoOg
 nPzqgAVM3Xv3xXrM9U/InLNvNXN2z0+HlPIg4zXs3J4NqCGOBrmZbuGzgDwFjlrhgd5T
 evGDu+c70rfpjewapaUDp8C77QVZPyXKeNEkShSpmmZDff6NvfZK9qRSQN3mzL5X3e8X
 Bw8hRnSelwuEyJbP9kj0ijYXpNlNgHuVoWY+Txo6HET9QCk1K030PgzHZlulPCrG5Xf+
 tiCg==
X-Gm-Message-State: AO0yUKWdZBBtU9WnWxJyuH08H+u3PBNLU9samUDpu782z+pjPiJiI5hU
 PmAy6aasBhLeae4ZmyBGgozUBto+CX9Uwx91QQfyqfQkGSBnsmLFky1pwjJabc8p1WOkdRSyxIP
 QaMYV7lSv7newHm5oNjp75pXqZ7BJIyOinQQzgg==
X-Received: by 2002:a50:f61b:0:b0:4bc:eec5:37f5 with SMTP id
 c27-20020a50f61b000000b004bceec537f5mr5830004edn.6.1678106834188; 
 Mon, 06 Mar 2023 04:47:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8tGjGVFa9l6Oz7NGjZKpCUJ1HrHE5LNsxo692Eigf3lWq+BjiUq2WqRJCevUtx2QlSu/l2LnnZ90BvOOaVHyw=
X-Received: by 2002:a50:f61b:0:b0:4bc:eec5:37f5 with SMTP id
 c27-20020a50f61b000000b004bceec537f5mr5829990edn.6.1678106833964; Mon, 06 Mar
 2023 04:47:13 -0800 (PST)
MIME-Version: 1.0
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 6 Mar 2023 07:47:02 -0500
Message-ID: <CAK-6q+hVu8xST=zreEdH3ne+kUY-zGriRwHAR9OpCxTwPFwOSw@mail.gmail.com>
To: peilin.ye@bytedance.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] introduce function wrapper for sk_data_ready() call?
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Network Development <netdev@vger.kernel.org>, cong.wang@bytedance.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I saw that in 6.3-rc1 the following patch introduced something in dlm
socket application handling 40e0b0908142 ("net/sock: Introduce
trace_sk_data_ready()"). I am asking myself if we could instead
introduce a wrapper in net/ protocol family implementations and they
do such trace event calls there inside the socket implementation
instead of letting the application layer do it. It looks pretty
generic for me and it does not trace any application specific
information.

I did something similar for sk_error_report(), see e3ae2365efc1 ("net:
sock: introduce sk_error_report").

Thanks.

- Alex

