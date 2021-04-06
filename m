Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 980F735561E
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Apr 2021 16:11:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-PblbAsw7OlWW8fNPxkZmOw-1; Tue, 06 Apr 2021 10:11:02 -0400
X-MC-Unique: PblbAsw7OlWW8fNPxkZmOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A913107B788;
	Tue,  6 Apr 2021 14:11:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 176425D6DC;
	Tue,  6 Apr 2021 14:10:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F1DF4A7C8;
	Tue,  6 Apr 2021 14:10:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136E64g4013132 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 10:06:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C0166E1DF; Tue,  6 Apr 2021 14:06:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 768ED6E1DE
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 14:06:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C77F480D2AF
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 14:06:01 +0000 (UTC)
Received: from wp484.webpack.hosteurope.de (wp484.webpack.hosteurope.de
	[80.237.133.253]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-515-htSLeurVP3-uexGSVBYHRA-1; Tue, 06 Apr 2021 10:05:58 -0400
X-MC-Unique: htSLeurVP3-uexGSVBYHRA-1
Received: from p579569be.dip0.t-ipconnect.de ([87.149.105.190]
	helo=[192.168.200.35]); authenticated
	by wp484.webpack.hosteurope.de running ExIM with esmtpsa
	(TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1lTlyu-0001nu-T7; Tue, 06 Apr 2021 15:43:00 +0200
To: cluster-devel@redhat.com
References: <20210326091151.311647-1-lee.jones@linaro.org>
	<20210406091126.GT2916463@dell>
	<468723920.4255981.1617709446972.JavaMail.zimbra@redhat.com>
From: Andreas Schindler <andreas.schindler@schindlerman.de>
Message-ID: <052f97ad-5fd3-e4f8-6339-bacaf0d8fd77@schindlerman.de>
Date: Tue, 6 Apr 2021 15:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <468723920.4255981.1617709446972.JavaMail.zimbra@redhat.com>
X-bounce-key: webpack.hosteurope.de; andreas.schindler@schindlerman.de;
	1617717958; ab0f33bf
X-HE-SMSGID: 1lTlyu-0001nu-T7
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] Unsubscribe from list
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: andreas.schindler@schindlerman.de
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
	boundary="------------13D2883F7DCF54C385DF07FB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------13D2883F7DCF54C385DF07FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

to whatever person manages this list.

Please unsubscribe my email address or give me a link where i can do it 
on my own.

Many thanks

*Andreas Schindler*
Klappacher Str. 2-i
D 64285 Darmstadt 
<https://www.openstreetmap.org/?mlat=49.8623&mlon=8.65461#map=17/49.8623/8.65461>
E-Mail: Andreas.Schindler@schindlerman.de 
<mailto:andreas.schindler@schindlerman.de>
Tel: +49 1575 6384244


--------------13D2883F7DCF54C385DF07FB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hello,<br>
     <br>
    to whatever person manages this list.<br>
    <br>
    Please unsubscribe my email address or give me a link where i can do
    it on my own.<br>
    <br>
    Many thanks<br>
     <br>
    <div class="moz-signature"><small><b>Andreas Schindler</b><br>
        <a
href="https://www.openstreetmap.org/?mlat=49.8623&amp;mlon=8.65461#map=17/49.8623/8.65461">Klappacher
          Str. 2-i<br>
          D 64285 Darmstadt</a><br>
        <a href="mailto:andreas.schindler@schindlerman.de">E-Mail:
          Andreas.Schindler@schindlerman.de</a><br>
        Tel: +49 1575 6384244<br>
      </small>
    </div>
    <br>
  </body>
</html>

--------------13D2883F7DCF54C385DF07FB--

