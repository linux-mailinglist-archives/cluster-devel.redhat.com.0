Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFE5A287B
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Aug 2022 15:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661520353;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UjS2O4t+aOXj1gb7edOnnQvwlSTlQg/GL0kaoQ1m9M4=;
	b=De0qSyTWQmF+uVjWOu0GJtS8zqnmzrVnfWu1vhIEX0sahd+ffM/FySYuBJXCBgds2SYcaW
	GPFsMYOuaptToOoA6UVHgwcu911ZvlZI7A0gbN9E4RsCvH8qZHSraYXZJLUWsBt5iqBwa3
	hv5Bm4ZzjhbKSBXgBk6NEiBihdcqmgA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-pnd8U0-JPlmLAhT2IrXcIg-1; Fri, 26 Aug 2022 09:25:49 -0400
X-MC-Unique: pnd8U0-JPlmLAhT2IrXcIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 695EF1C13952;
	Fri, 26 Aug 2022 13:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDF82166B26;
	Fri, 26 Aug 2022 13:25:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C42AD1946A52;
	Fri, 26 Aug 2022 13:25:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1C321946A4E for <cluster-devel@listman.corp.redhat.com>;
 Fri, 26 Aug 2022 13:25:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A30792166B29; Fri, 26 Aug 2022 13:25:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FD962166B26
 for <cluster-devel@redhat.com>; Fri, 26 Aug 2022 13:25:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 853741C13951
 for <cluster-devel@redhat.com>; Fri, 26 Aug 2022 13:25:44 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-IMecau7GN1yNnXCGO0lLJw-1; Fri, 26 Aug 2022 09:25:35 -0400
X-MC-Unique: IMecau7GN1yNnXCGO0lLJw-1
Received: by mail-pf1-f198.google.com with SMTP id
 b13-20020aa7870d000000b0053729698c60so905019pfo.2
 for <cluster-devel@redhat.com>; Fri, 26 Aug 2022 06:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=UjS2O4t+aOXj1gb7edOnnQvwlSTlQg/GL0kaoQ1m9M4=;
 b=bRCxk06Y1CY5LpMgpDNZ6pZSzwtgSIZEOYQT17zFX+6+DxMOikykrIeaFgLMxRFIe5
 ca9qKinZJuBHwYkbwbNvFQ7BIP7+FI9yRY5ivqift5sLBCfAfXg5ouUhg+mZgag36tUN
 01kyUQfztR4Q9eAnYqlz8W4r9w5izspWczf5HqvdWOY4OcYOxEsjso0gIenx5hKAZYLS
 fP0JqcFQTbKJ1giQ0He31r5bRT5tay9t5VjTFlYAAjrJJqSZBmVK2iQYDj2nWStm3YHp
 RqNx2JEQd3abw5hoBoC141tutAnShYRKs4zyi2G0XLvDfpivoPaJNMIrlPCM0Emkfk8N
 pgDA==
X-Gm-Message-State: ACgBeo0Rx13YMtnIQnFHJCU6DFiwpe+2DbuegrIxODTeq1bbmRgEKbWd
 Lv+xMiSBr4Usf92vtKRlTe4mRzJ7FPNC4c8rwphZQWE1vRsfxYSGy+dMgm8xSNzkuTbs9/hynaR
 JsjqbO3NmWgID5/9YKbFxkdtgkzoaHZE1OYk52w==
X-Received: by 2002:a63:211:0:b0:41d:946e:cf67 with SMTP id
 17-20020a630211000000b0041d946ecf67mr3282524pgc.497.1661520334774; 
 Fri, 26 Aug 2022 06:25:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xF4GijyT5YL/pHPs7RpNbVVqlsP2T8W1Gp6jh2yfBYGlopFWShAPPxbyWTf9KT9uLezlA+a+vOIoAuLpweWo=
X-Received: by 2002:a63:211:0:b0:41d:946e:cf67 with SMTP id
 17-20020a630211000000b0041d946ecf67mr3282504pgc.497.1661520334523; Fri, 26
 Aug 2022 06:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <AFQA3gCKFKPruj6DtSI6oaqd.1.1661219001658.Hmail.3014218099@tju.edu.cn>
In-Reply-To: <AFQA3gCKFKPruj6DtSI6oaqd.1.1661219001658.Hmail.3014218099@tju.edu.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 26 Aug 2022 15:25:23 +0200
Message-ID: <CAHc6FU44=yMSq2FHzumL+Fe7x63qgMYt5Xtw5ctwB7dRG09mEQ@mail.gmail.com>
To: =?UTF-8?B?546L5rW35byb?= <wanghaichi@tju.edu.cn>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] kernel BUG in gfs2_fill_super
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
Cc: cluster-devel@redhat.com, syzkaller@googlegroups.com,
 linux-kernel@vger.kernel.org, lishuochuan@tju.edu.cn
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 3:52 AM =E7=8E=8B=E6=B5=B7=E5=BC=9B <wanghaichi@tju=
.edu.cn> wrote:
> Dear Linux maintainers and reviewers:
>
> We would like to report a linux kernel bug, found by a modified version o=
f syzkaller.
>
> May affected file: fs/gfs2/ops_fstype.c

Thank you.

Andreas

