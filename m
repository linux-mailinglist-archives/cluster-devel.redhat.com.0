Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2627C6ADC16
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 11:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678185441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N/C3Y5pzRvo7wBoP0uW3mPJBJ+iAoy4QrLO7EEgHu8Y=;
	b=SZWFQ9Gg8uYZxKsTZGdWs1yzg8Ie+N88TkSoZReBwiRsyGnsqPDOy6gE0I9RiWdevSbT06
	6H6G+tdR4XIh41zAQNCsDH1WeGEzZjDTL24H829uYsGcGLgHOxLj7gEuvJoKNxKJIowt7+
	T9581bC+9fYktjMA5s4MSPeX3W1Rsqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-Tf8_ox6KPuqJVele0msgCw-1; Tue, 07 Mar 2023 05:37:16 -0500
X-MC-Unique: Tf8_ox6KPuqJVele0msgCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 648C13C14844;
	Tue,  7 Mar 2023 10:37:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F4CC112132D;
	Tue,  7 Mar 2023 10:37:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9F98B19465A8;
	Tue,  7 Mar 2023 10:37:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C21CB1946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 00:58:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C10D492C3E; Tue,  7 Mar 2023 00:58:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 650B9492B00
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 00:58:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A7A685A5A3
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 00:58:01 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-xB9urR3IPNau8sHvKS5KRw-1; Mon, 06 Mar 2023 19:57:59 -0500
X-MC-Unique: xB9urR3IPNau8sHvKS5KRw-1
X-IronPort-AV: E=Sophos;i="5.98,238,1673913600"; d="scan'208";a="315492567"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-9694bb9e.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 00:56:50 +0000
Received: from EX13MTAUWB002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1e-m6i4x-9694bb9e.us-east-1.amazon.com (Postfix)
 with ESMTPS id 208C580F41; Tue,  7 Mar 2023 00:56:49 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Tue, 7 Mar 2023 00:56:48 +0000
Received: from 88665a182662.ant.amazon.com (10.187.170.29) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.24; Tue, 7 Mar 2023 00:56:46 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <aahringo@redhat.com>
Date: Mon, 6 Mar 2023 16:56:38 -0800
Message-ID: <20230307005638.76597-1-kuniyu@amazon.com>
In-Reply-To: <CAK-6q+hVu8xST=zreEdH3ne+kUY-zGriRwHAR9OpCxTwPFwOSw@mail.gmail.com>
References: <CAK-6q+hVu8xST=zreEdH3ne+kUY-zGriRwHAR9OpCxTwPFwOSw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.187.170.29]
X-ClientProxiedBy: EX19D038UWC002.ant.amazon.com (10.13.139.238) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Tue, 07 Mar 2023 10:37:12 +0000
Subject: Re: [Cluster-devel] introduce function wrapper for sk_data_ready()
 call?
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
Cc: cong.wang@bytedance.com, netdev@vger.kernel.org, cluster-devel@redhat.com,
 kuniyu@amazon.com, peilin.ye@bytedance.com, davem@davemloft.net
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From:   Alexander Aring <aahringo@redhat.com>
Date:   Mon, 6 Mar 2023 07:47:02 -0500
> 
> Hi,
> 
> I saw that in 6.3-rc1 the following patch introduced something in dlm
> socket application handling 40e0b0908142 ("net/sock: Introduce
> trace_sk_data_ready()"). I am asking myself if we could instead
> introduce a wrapper in net/ protocol family implementations and they
> do such trace event calls there inside the socket implementation
> instead of letting the application layer do it. It looks pretty
> generic for me and it does not trace any application specific
> information.

I think you cannot apply the same logic to some functions which call
trace_sk_data_ready() twice, e.g. subflow_data_ready, tls_data_ready().

Then, only such functions need an additional trace_sk_data_ready(),
which is not clean, I think.

Thanks,
Kuniyuki


> 
> I did something similar for sk_error_report(), see e3ae2365efc1 ("net:
> sock: introduce sk_error_report").
> 
> Thanks.
> 
> - Alex

